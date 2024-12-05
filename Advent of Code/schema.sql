DROP TABLE IF EXISTS dbo.AoC_Input_Raw;
CREATE TABLE dbo.AoC_Input_Raw (
	PuzzleDay	date			NOT NULL,
	IsSample	bit				NOT NULL,
	PuzzleInput	nvarchar(MAX)	NOT NULL,
	INDEX CIX UNIQUE CLUSTERED (PuzzleDay, IsSample)
)
GO
CREATE OR ALTER PROC dbo.usp_Import_AoC_Input (
	@PuzzleDay date,
	@IsSample bit,
	@PuzzleInput nvarchar(MAX)
)
AS
BEGIN;
	DELETE r FROM dbo.AoC_Input_Raw r WHERE r.PuzzleDay = @PuzzleDay AND r.IsSample = @IsSample

	INSERT dbo.AoC_Input_Raw (PuzzleDay, IsSample, PuzzleInput)
	VALUES (@PuzzleDay, @IsSample, REPLACE(@PuzzleInput, CHAR(13)+CHAR(10), CHAR(10)))
END;
GO