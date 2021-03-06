CREATE FUNCTION FT_GET_RESULT_EXAM(@IDExam INT)
RETURNS TABLE  
AS  
RETURN   
(  
	SELECT
	CASE 
		WHEN EXAM.score >= TEST.high_level THEN 'ACQUIS'
		WHEN EXAM.score < TEST.high_level AND EXAM.score >= TEST.low_level THEN 'EN COURS'
		ELSE 'NON ACQUIS'
	END as Result,
	T1.nbQuestion,
	EXAM.id as IdExam,
	Test.label,
	T2.nbRightQuestion,
	T3.nbAnsweredQuestion,
	ROUND(T6.note,0) as note
	FROM EXAM	
		JOIN TEST ON TEST.id = EXAM.idTest
		JOIN
		(
			-- Get the number off questions
			SELECT COUNT(*) as nbQuestion, idExam 
			FROM DRAW_QUESTION WHERE idExam = @IDExam
			GROUP BY idExam
		) T1 ON T1.idExam = EXAM.id
		LEFT OUTER JOIN
		(
			-- Get the number off right question
			SELECT COUNT(nbRightQuestionByQuestion) as nbRightQuestion, idExam
			FROM EXAM
				JOIN
				(
					SELECT  COUNT(*) as nbRightQuestionByQuestion, DRAW_ANSWER.idExam
					FROM DRAW_ANSWER
						JOIN PROPOSITION ON PROPOSITION.id = DRAW_ANSWER.idProposition
					WHERE PROPOSITION.isTrue = 1
					GROUP BY DRAW_ANSWER.idExam, DRAW_ANSWER.idQuestion
				) T5 ON T5.idExam = EXAM.id
			GROUP BY idExam
		) T2 ON T2.idExam = EXAM.id
		JOIN
		(
			-- Get the number off answered question
			SELECT COUNT(nbAnswerByQuestion) as nbAnsweredQuestion, idExam
			FROM EXAM
				JOIN
				(
				SELECT COUNT(*) as nbAnswerByQuestion, idExam
				FROM DRAW_ANSWER 
				WHERE idExam = @IDExam
				GROUP BY idQuestion, idExam
				) T4 ON T4.idExam = EXAM.id
				GROUP BY idExam
		) T3 ON T3.idExam = EXAM.id
		LEFT OUTER JOIN
		(
			-- Get the note 
			SELECT (CAST(EXAM.score AS DECIMAL)/ CAST(SUM(QUESTION.points) AS DECIMAL) *20 ) AS note, idExam
			FROM EXAM INNER JOIN
				 DRAW_QUESTION ON DRAW_QUESTION.idExam=EXAM.id INNER JOIN
				 QUESTION ON DRAW_QUESTION.idQuestion=QUESTION.id
			WHERE EXAM.id=@IDExam
			GROUP BY score,idExam
		) T6 ON T6.idExam = EXAM.id
	WHERE EXAM.id= @IDExam
);  