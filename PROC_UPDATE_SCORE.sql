CREATE PROCEDURE PROC_UPDATE_SCORE(@IDExam INT)
AS
BEGIN

DECLARE @Score INT

SELECT  @Score = SUM(QUESTION.points)
FROM EXAM
	JOIN DRAW_ANSWER ON EXAM.id = DRAW_ANSWER.idExam
	JOIN PROPOSITION ON PROPOSITION.id = DRAW_ANSWER.idProposition
	JOIN QUESTION ON QUESTION.id = PROPOSITION.id
WHERE EXAM.id = 3
AND PROPOSITION.isTrue = 1

PRINT(@Score)

UPDATE EXAM SET EXAM.score = @Score WHERE EXAM.id = @IDExam

END