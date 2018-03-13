
CREATE TABLE Player (
    username        char(15) not null primary key,
    pwd		        	char(15) not null,
    fullname        	char(15) not null,
    balance         	double   not null,
    xp              		double   not null
);

CREATE TABLE Ingredient (
    IngredientID    	 int not null auto_increment primary key,
    IngredientName   char(15)    not null,
    price           			 double      not null
);

# This is to track the number of ingredients each Player has
# A player has zero or many Ingredients. Hence, must be modelled
# as a seperate relation.
CREATE TABLE PlayerInventory (
    username        char(15)    not null,
    IngredientID    int         not null,
    quantity        	int         not null,
    CONSTRAINT PlayerInventory_pk PRIMARY KEY (username,IngredientID),
    CONSTRAINT PlayerInventory_fk1 FOREIGN KEY (username) REFERENCES Player(username),
    CONSTRAINT PlayerInventory_fk2 FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);

CREATE TABLE Recipe (
    recipeName      char(15)    not null     primary key,
    cookingtime      int         	   not null,
    moneyEarned   double       not null,
    xpGained        	 double       not null
);

CREATE TABLE RecipeIngredient (
	recipeName 	char(15) not null,
    IngredientID	int unsigned not null,
    quantity			int unsigned not null,
    CONSTRAINT RecipeIngredient_pk PRIMARY KEY (recipeName, IngredientID),
    CONSTRAINT RecipeIngredient_fk1 FOREIGN KEY (recipeName) REFERENCES Player(username),
    CONSTRAINT RecipeIngredient_fk2 FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);

# XP is lower bound of corresponding title
CREATE TABLE Title (
    titlename       char(15)    not null    primary key,
    xp       			  double      not null
);


CREATE TABLE PlayerRecipe (
    username        char(15)        not null,
    recipeName      char(15)        not null,
    CONSTRAINT PlayerRecipe_pk PRIMARY KEY (username, recipeName),
    CONSTRAINT PlayerRecipe_fk1 FOREIGN KEY (username) REFERENCES Player(username),
    CONSTRAINT PlayerRecipe_fk2 FOREIGN KEY (recipeName) REFERENCES Recipe(recipeName)
);

