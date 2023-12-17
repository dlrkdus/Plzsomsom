
CREATE SEQUENCE commentsSeq
	INCREMENT BY 1
	START WITH 5000;

CREATE SEQUENCE postSeq
	INCREMENT BY 1
	START WITH 1000;

CREATE SEQUENCE reviewSeq
	INCREMENT BY 1
	START WITH 4000;

CREATE SEQUENCE transactionSeq
	INCREMENT BY 1
	START WITH 2000;

CREATE SEQUENCE wishSeq
	INCREMENT BY 1
	START WITH 3000;

CREATE TABLE UserInfo
(
   userId               VARCHAR2(20)  NOT NULL ,
   password             VARCHAR2(24)  NOT NULL  CONSTRAINT  password_limit_16725860 CHECK (length(password) BETWEEN 4 AND 10),
   name                 VARCHAR2(20)  NOT NULL ,
   nickname             VARCHAR2(20)  NOT NULL  CONSTRAINT  nickname_limit_688840361 CHECK (length(nickname) BETWEEN 2 AND 8),
   phone                CHAR(18)  NULL ,
   email                VARCHAR2(30)  NOT NULL ,
   joinDate             DATE  DEFAULT SYSDATE  NOT NULL 
);


CREATE UNIQUE INDEX XPKUserInfo ON UserInfo
(userId   ASC);

ALTER TABLE UserInfo
	ADD CONSTRAINT  XPKUserInfo PRIMARY KEY (userId);

CREATE TABLE Post
(
	postNum              INTEGER  NOT NULL ,
	postContent          VARCHAR2(500)  NOT NULL  CONSTRAINT  Long_word_limit_215685499 CHECK (length(postContent) BETWEEN 0 AND 500),
	postDate             DATE  DEFAULT SYSDATE  NOT NULL ,
	price                INTEGER  NOT NULL ,
	count                INTEGER  NOT NULL ,
	time                 DATE  DEFAULT SYSDATE  NOT NULL ,
	photo                VARCHAR2(40)  NULL ,
	productCategoryNum   VARCHAR2(20)  NOT NULL ,
	postWriterId         VARCHAR2(20)  NOT NULL ,
	title                VARCHAR2(40)  NOT NULL 
);

CREATE UNIQUE INDEX XPKPost ON Post
(postNum   ASC);

ALTER TABLE Post
	ADD CONSTRAINT  XPKPost PRIMARY KEY (postNum);

CREATE TABLE Comments
(
	CommentsNum          CHAR(18)  NOT NULL ,
	commContent          VARCHAR2(100)  NOT NULL  CONSTRAINT  Short_word_limit_1716443892 CHECK (length(commContent) BETWEEN 0 AND 100),
	commWriteDate        DATE  DEFAULT SYSDATE  NOT NULL ,
	postNum              INTEGER  NOT NULL ,
	commWriterId         VARCHAR2(20)  NOT NULL 
);

CREATE UNIQUE INDEX XPKComments ON Comments
(CommentsNum   ASC);

ALTER TABLE Comments
	ADD CONSTRAINT  XPKComments PRIMARY KEY (CommentsNum);

CREATE TABLE Review
(
	ReviewNum            INTEGER  NOT NULL ,
	reviewContent        VARCHAR2(100)  NOT NULL  CONSTRAINT  Short_word_limit_1584452595 CHECK (length(reviewContent) BETWEEN 0 AND 100),
	reviewWriteDate      DATE  DEFAULT SYSDATE  NOT NULL ,
	postNum              INTEGER  NOT NULL ,
	reviewWriterId       VARCHAR2(20)  NOT NULL 
);

CREATE UNIQUE INDEX XPKReview ON Review
(ReviewNum   ASC);

ALTER TABLE Review
	ADD CONSTRAINT  XPKReview PRIMARY KEY (ReviewNum);

CREATE TABLE WishItem
(
	wishNum              INTEGER  NOT NULL ,
	postNum              INTEGER  NOT NULL ,
	userId               VARCHAR2(20)  NOT NULL 
);

CREATE UNIQUE INDEX XPKWishItem ON WishItem
(wishNum   ASC);

ALTER TABLE WishItem
	ADD CONSTRAINT  XPKWishItem PRIMARY KEY (wishNum);

CREATE TABLE Transaction
(
	transactionNum       INTEGER  NOT NULL ,
	userId               VARCHAR2(20)  NOT NULL ,
	postNum              INTEGER  NOT NULL 
);

CREATE UNIQUE INDEX XPKTransaction ON Transaction
(transactionNum   ASC);

ALTER TABLE Transaction
	ADD CONSTRAINT  XPKTransaction PRIMARY KEY (transactionNum);

CREATE TABLE ProductCategory
(
	productCategoryNum   VARCHAR(20)  NOT NULL 
);

CREATE UNIQUE INDEX XPKProductCategory ON ProductCategory
(productCategoryNum   ASC);

ALTER TABLE ProductCategory
	ADD CONSTRAINT  XPKProductCategory PRIMARY KEY (productCategoryNum);

ALTER TABLE Post
	ADD (
CONSTRAINT R_9 FOREIGN KEY (productCategoryNum) REFERENCES ProductCategory (productCategoryNum) ON DELETE CASCADE);

ALTER TABLE Post
	ADD (
CONSTRAINT R_13 FOREIGN KEY (postWriterId) REFERENCES UserInfo (userId) ON DELETE CASCADE);

ALTER TABLE Comments
	ADD (
CONSTRAINT R_1 FOREIGN KEY (postNum) REFERENCES Post (postNum) ON DELETE CASCADE);

ALTER TABLE Comments
	ADD (
CONSTRAINT R_11 FOREIGN KEY (commWriterId) REFERENCES UserInfo (userId) ON DELETE CASCADE);

ALTER TABLE Review
	ADD (
CONSTRAINT R_17 FOREIGN KEY (postNum) REFERENCES Post (postNum) ON DELETE CASCADE);

ALTER TABLE Review
	ADD (
CONSTRAINT R_24 FOREIGN KEY (reviewWriterId) REFERENCES UserInfo (userId) ON DELETE CASCADE);

ALTER TABLE WishItem
	ADD (
CONSTRAINT R_19 FOREIGN KEY (postNum) REFERENCES Post (postNum) ON DELETE CASCADE);

ALTER TABLE WishItem
	ADD (
CONSTRAINT R_28 FOREIGN KEY (userId) REFERENCES UserInfo (userId) ON DELETE CASCADE);

ALTER TABLE Transaction
	ADD (
CONSTRAINT R_35 FOREIGN KEY (userId) REFERENCES UserInfo (userId) ON DELETE CASCADE);

ALTER TABLE Transaction
	ADD (
CONSTRAINT R_36 FOREIGN KEY (postNum) REFERENCES Post (postNum) ON DELETE CASCADE);