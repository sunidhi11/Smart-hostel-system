
------------seema start ---------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Feedback` (
  `feedbackId` INT NOT NULL AUTO_INCREMENT,
  `hostelId` INT NULL,
  `Stu_name` VARCHAR(40) NULL,
  `food` VARCHAR(45) NULL,
  `clean` VARCHAR(45) NULL,
  `maintain` VARCHAR(45) NULL,  
  `rating` VARCHAR(45) NULL,  
  `message` VARCHAR(500) NULL,
  `dof` TIMESTAMP  NULL, 
  PRIMARY KEY (`feedbackId`))
    ENGINE = InnoDB;
    
    CREATE TABLE IF NOT EXISTS `mydb`.`Register_Student` (
  `regno` INT NOT NULL AUTO_INCREMENT,
  `rollno` INT NOT NULL UNIQUE,
  `name` VARCHAR(45) NOT NULL UNIQUE,
  `course` VARCHAR(45) NULL ,
  `branch` VARCHAR(45) NULL ,
  `mobileno` INT NULL UNIQUE,
  `email` VARCHAR(45) NULL UNIQUE,
  `semester` INT NULL ,
  `cgpa` FLOAT NULL ,
  `enrollment` INT NULL UNIQUE,
  `hostel` VARCHAR(45) NULL ,
  `gender` VARCHAR(45) NULL ,
  `category` VARCHAR(45) NULL ,
  `dob` DATE NULL ,
  `address` VARCHAR(45) NULL ,
  `accno` INT NULL UNIQUE,
   `selected` varchar(5) not null default "no",
  PRIMARY KEY (`regno`))
ENGINE = InnoDB;
-------------------------seema end--------------------------
-------------------------shaurya start---------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Admin` (
  `adminId` INT NOT NULL ,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `mobile` INT NULL,
  `gender` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `doj` DATE NULL,
  `fatherName` VARCHAR(45) NULL,
  PRIMARY KEY (`adminId`),
  FOREIGN KEY (adminId)
  REFERENCES admin_login(adminId)
  ON DELETE CASCADE
  )
ENGINE = InnoDB;

CREATE TABLE  `mydb`.`Admin_Login` (
  `adminId` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `lastLogin` TIMESTAMP(6) NULL,
  `registered` int default 0,
  PRIMARY KEY (`adminId`)
  )
ENGINE = InnoDB AUTO_INCREMENT=1000;
drop table admin_login;
drop table admin;

insert into admin_login (adminId,userName,password,lastLogin)values(1000,'admin','admin',now());
insert into admin_login (adminId,userName,password,lastLogin)values(1003,'ad','ad',now());
insert into admin_login (adminId,userName,password,lastLogin)values(1004,'admin1','admin1',now());

create table `mydb`.`attendance`(
  TODAY DATE,
  hostelId int ,
  status int,
  foreign key (hostelId) references student(hostelId),
  CONSTRAINT Attendance_Check UNIQUE (today,hostelId)
);


CREATE TABLE IF NOT EXISTS `mydb`.`leave_request`(
  `leaveId` INT NOT NULL AUTO_INCREMENT,
  `hostelId` INT NULL,
  `entryDate` DATE NULL,
  `fromDate` DATE NULL,
  `toDate` DATE NULL,
  `subject` VARCHAR(100) NULL,
  `reason` VARCHAR(100) NULL,
  `seenByStudent` VARCHAR(3) DEFAULT "NO",
  `seenByAdmin` VARCHAR(3) DEFAULT "NO",
  `seenByParent` VARCHAR(3) DEFAULT "NO",
  `approvedByAdmin` VARCHAR(3) DEFAULT "NO",
  `approvedByParent` VARCHAR(3) DEFAULT "NO",
  `deletedByParent` VARCHAR(3) DEFAULT "NO",
  `deletedByStudent` VARCHAR(3) DEFAULT "NO",
  `deletedByAdmin` VARCHAR(3) DEFAULT "NO",
  `sendToStudentEmail` VARCHAR(3) DEFAULT "NO",
  `sendToStudentEmailTime` DATE NULL,

  PRIMARY KEY (`leaveId`))
ENGINE = InnoDB;


CREATE TABLE `mydb`.`Parent_Login` (
  `parentId` INT NOT NULL,
  `userName` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `lastLogin` TIMESTAMP(6) NULL,
  PRIMARY KEY (`parentId`)
  )
ENGINE = InnoDB;

insert into parent_login(parentId,userName,password,lastLogin)values(1000,'parent','parent',now() );



CREATE TABLE IF NOT EXISTS `mydb`.query(
	id int(11) not null,
	queryId int(11),
	sourceId int(11),     
	destinationId int(11),
 	message varchar(100) ,
 	subject varchar(100), 
 	seen varchar(3) default "no",   
 	deletedForSource varchar(3) default "no",   
 	deletedForDestination varchar(3) default "no",   
 	time timestamp(6),    
	PRIMARY KEY (`id`))
ENGINE = InnoDB AUTO_INCREMENT=1;
-------------------------shaurya end---------------------------


------------------monika start-----------------------------------
-- -----------------------------------------------------
-- Table `mydb`.`Worker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Worker` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Worker` (
  `workerId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `fatherName` VARCHAR(45) NULL,
  `motherName` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `mobile` INT NULL,
  `gender` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `doj` DATE NULL,
  `aadhar` int null,
  
  PRIMARY KEY (`workerId`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table WorkerAttendence`------------------------------
-- ----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`WorkerAttendence` ;

CREATE TABLE IF NOT EXISTS `mydb`.`WorkerAttendence` (
  `WorkerId` INT NULL,
  `date` DATE NULL,
  `status` VARCHAR(45) NULL)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Complain`
-- -----------------------------------------------------
++DROP TABLE IF EXISTS `mydb`.`Complain` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Complain` (
  `complainId` INT NOT NULL AUTO_INCREMENT,
  `hostelId` INT NULL,
  `complainDate` DATE NULL,
  `department` VARCHAR(45) NULL,
  `complain` VARCHAR(45) NULL,
  `status` VARCHAR(10) NULL,
  `solveDate` DATE NULL,
  `email`  varchar(40) null,
  `sentstudent` varchar(10),
  PRIMARY KEY (`complainId`))
ENGINE = InnoDB;


----------------monika end-------------------------------------

------------------sunidhi start---------------------------------
DROP TABLE IF EXISTS `mydb`.`Register_Student` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Register_Student` (
  `regno` INT NOT NULL AUTO_INCREMENT,
  `rollno` INT NOT NULL UNIQUE,
  `name` VARCHAR(45) NOT NULL UNIQUE,
  `course` VARCHAR(45) NULL ,
  `branch` VARCHAR(45) NULL ,
  `mobileno` varchar(45) NULL UNIQUE,
  `email` VARCHAR(45) NULL UNIQUE,
  `semester` INT NULL ,
  `cgpa` FLOAT NULL ,
  `enrollment` INT NULL UNIQUE,
  `hostel` VARCHAR(45) NULL ,
  `gender` VARCHAR(45) NULL ,
  `category` VARCHAR(45) NULL ,
  `dob` DATE NULL ,
  `address` VARCHAR(45) NULL ,
  `accno` varchar(45) NULL UNIQUE,
   `selected` varchar(5) not null default "NO",
   `confirm` varchar(5) not null default "no",
   `isdeleted` varchar(15) not null default "no",
  PRIMARY KEY (`regno`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Regstu_Parent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Regstu_Parent`;
AUTO_INCREMENT=1000

CREATE TABLE IF NOT EXISTS `mydb`.`Regstu_Parent` (
  `regno` INT NOT NULL,
  `fatherName` VARCHAR(45) NOT NULL ,
  `motherName` VARCHAR(45) NOT NULL ,
  `fathermobile` varchar(45) ,
  `fatherAdress` VARCHAR(45) ,
  `fatherEmail` VARCHAR(45) ,
  `fatherImage` LongBLOB ,
  `localGaurdianName` VARCHAR(45) ,
  `localGaurdianMobile` varchar(45) ,
  PRIMARY KEY (`regno`),
  CONSTRAINT `regno`
    FOREIGN KEY (`regno`)
    REFERENCES `mydb`.`Register_Student` (`regno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Regstu_Doc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Regstu_Doc` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Regstu_Doc` (
  `regno` INT NOT NULL,
  `stuImage` LongBLOB NULL,
  `stuThumb` LongBLOB NULL,
  `stuResult` LongBLOB NULL,
  `stuCategory` LongBLOB NULL,
  PRIMARY KEY (`regno`),
  CONSTRAINT `regno1`
    FOREIGN KEY (`regno`)
    REFERENCES `mydb`.`Register_Student` (`regno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Student` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `hostelId` INT NOT NULL AUTO_INCREMENT,
  `rollno` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `course` VARCHAR(45) NULL,
  `branch` VARCHAR(45) NULL,
  `mobileno` varchar(45) NULL,
  `email` VARCHAR(45) NULL,
  `semester` INT NULL,
  `cgpa` INT NULL,
  `enrollment` INT NULL UNIQUE,
  `hostel` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `category` varchar(45) NULL,
  `dob` DATE NULL,
  `address` VARCHAR(45) NULL,
  `acno` varchar(45) NULL,
  `roomno` VARCHAR(45) NULL
  `isdeleted` varchar(15) not null default "no"
  PRIMARY KEY (`hostelId`))
ENGINE = InnoDB AUTO_INCREMENT=1001;

   
        
-- -----------------------------------------------------
-- Table `mydb`.`Stu_Doc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Stu_Doc` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Stu_Doc` (
  `hostelId` INT NOT NULL,
  `stuImage` LongBLOB NULL,
  `stuThumb` LongBLOB NULL,
  `stuResult` LongBLOB NULL,
  `stuCategory` LOngBLOB NULL,
  `isdeleted` varchar(15) not null default "no",
  PRIMARY KEY (`hostelId`),
  CONSTRAINT `hostelId`
    FOREIGN KEY (`hostelId`)
    REFERENCES `mydb`.`Student` (`hostelId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Stu_Parent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Stu_Parent` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Stu_Parent` (
  `hostelId` INT NOT NULL,
  `fatherName` VARCHAR(45) NULL,
  `motherName` VARCHAR(45) NULL,
  `fatherMobile` varchar(45) NULL,
  `fatherAddress` VARCHAR(45) NULL,
  `fatherEmail` VARCHAR(45) NULL,
  `fatherImage` LongBLOB NULL,
  `localGaurdianName` VARCHAR(45) NULL,
  `localGaurdianMobile` varchar(45) NULL,
  `isdeleted` varchar(15) not null default "no"
  PRIMARY KEY (`hostelId`),
  CONSTRAINT `hostelId1`
    FOREIGN KEY (`hostelId`)
    REFERENCES `mydb`.`Student` (`hostelId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Du_No`(
`sno` INT not null PRIMARY key AUTO_INCREMENT,
name VARCHAR(45),
enrollment int,
du_no varchar(45)
)                             
ENGINE = InnoDB;

insert into Du_No(name,enrollment,Du_No)values("MONIKA",150161,"DU161");

DROP TABLE IF EXISTS `mydb`.`Mess_Menu` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mess_Menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `day` VARCHAR(45) NULL,
  `breakfast` VARCHAR(45) NULL,
  `lunch` VARCHAR(45) NULL,
  `snacks` VARCHAR(45) NULL,
  `dinner` VARCHAR(45) NULL,
  `updateDate` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


insert into mess_menu values(1,'monday','poha_jalebi_tea','bhindi','kachori_tea','rajma',null);
    insert into mess_menu values(2,'tuesday','paratha_aloo_sabji(gravy)_tea','chhole','chowmein\pasta_tea','parval',null);
      insert into mess_menu values(3,'wednesday','idly_chutney_sambhar_tea','kofta','panipuri(10pcs)_tea','barbati_green',null);
        insert into mess_menu values(4,'thursday','poori_sabji(aloo_gravy)_tea','cabbage','samosa/kachori_tea','bottlegourd/cucumber_kadhi',null);
         insert into mess_menu values(5,'friday','upama','aloo_fry','chat_tea','kalachna',null);
          insert into mess_menu values(6,'saturday','pavbhaji','karela','cutlet_tea','palak_aloo',null);
           insert into mess_menu values(7,'sunday','dosa_chutney_sambhar_tea','brinjal(deepfry)','coffee_srouts/biscuit/toast','salad_sweet_papad_raitha_biryani_sabji_poori',null);
-----------------sunidhi end--------------------------
   CREATE TABLE IF NOT EXISTS `mydb`.`leave_file`(
  `leaveId` INT NOT NULL AUTO_INCREMENT,
`photo1` mediumblob,
`photo2` mediumblob,
foreign key (leaveId) references leave_request(leaveId)
)
ENGINE = InnoDB;
  PRIMARY KEY (`leaveId`))        
           