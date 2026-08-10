-- Respondent Table Creation
CREATE TABLE Respondent (
    Respondent_ID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(20),
    State VARCHAR(100),
    Role VARCHAR(100)
);

select * from Respondent; -- data import successful

select count(*) from Respondent;  --1565 rows


--Dataset import into the below table was failing repeatdely due to Datatypes issues. hence this is dropped
CREATE TABLE Lifestyle_Habits (
    Lifestyle_ID INT PRIMARY KEY,
    Respondent_ID INT,
    Work_Study_Hrs DECIMAL(4,1),
    Sleep_Hrs DECIMAL(4,1),
    Physical_Activity_Days INT,
    Screen_Time DECIMAL(4,1),
    Outings_Freq VARCHAR(50),
    Sleep_Quality VARCHAR(50),
    SocialMedia_Mood VARCHAR(50),
    Regular_Breaks VARCHAR(20),
    Has_Coping_Strategy VARCHAR(20),
    CONSTRAINT fk_lifestyle_respondent FOREIGN KEY (Respondent_ID) REFERENCES Respondent(Respondent_ID)
);

DROP TABLE lifestyle_habits;

-- NOTE:
-- Initial data import into Lifestyle_Habits failed because several columns
-- were defined as NUMERIC/INT while the source CSV contained categorical
-- text values such as:
--   'More than 8 hours'
--   '1-2 days'
--   '6+ hrs'
--
-- To accommodate the actual dataset structure, the following columns were
-- changed from numeric types to VARCHAR:
--   Work_Study_Hrs
--   Sleep_Hrs
--   Physical_Activity_Days
--   Screen_Time
--
-- After updating the datatypes, the CSV import completed successfully.

CREATE TABLE Lifestyle_Habits (
    Lifestyle_ID INT PRIMARY KEY,
    Respondent_ID INT,
    Work_Study_Hrs VARCHAR(50),
    Sleep_Hrs VARCHAR(50),
    Physical_Activity_Days VARCHAR(50),
    Screen_Time VARCHAR(50),
    Outings_Freq VARCHAR(50),
    Sleep_Quality INT,
    SocialMedia_Mood INT,
    Regular_Breaks VARCHAR(10),
    Has_Coping_Strategy VARCHAR(10),
    FOREIGN KEY (Respondent_ID)
    REFERENCES Respondent(Respondent_ID)
);

select * from Lifestyle_Habits; -- data import successful

select count(*) from Lifestyle_Habits; --1565 rows 


-- Mental_Health_Assessment table Creation 
CREATE TABLE Mental_Health_Assessment (
    Assessment_ID INT PRIMARY KEY,
    Respondent_ID INT,
    Low_Interest VARCHAR(20),
    Depressed VARCHAR(20),
    Sleep_Trouble VARCHAR(20),
    Low_Energy VARCHAR(20),
    Poor_Concentration VARCHAR(20),
    Anxiety VARCHAR(20),
    Emotional_Drain VARCHAR(20),
    Stress_Level INT,
    Burnout VARCHAR(20),
    Work_Pressure VARCHAR(20),
    WL_Balance VARCHAR(20),
    Life_Control VARCHAR(20),
    Family_Support VARCHAR(20),
    Coping_Mechanism VARCHAR(100),
    Therapist_Consult VARCHAR(20),
    Social_Support VARCHAR(20),
    MH_Affected VARCHAR(20),
    CONSTRAINT fk_mha_respondent FOREIGN KEY (Respondent_ID) REFERENCES Respondent(Respondent_ID)
);

select * from Mental_Health_Assessment; -- data import successful

select count(*) from Mental_Health_Assessment; --1565 rows

