import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';
import QuestionCard from '../components/QuestionCard';
import { useState, useEffect } from 'react';
import { FullQuestionDto } from '../models/models';

function QuestionsPage() {
    const [questions, setQuestions] = useState<FullQuestionDto[]>([]);
    useEffect(() => {
        fetch('http://localhost:4000/fullquestions').then((response) => {
            response.json().then((res: any) => {
                const fullQuestions: FullQuestionDto[] = res.responseBody;
                console.log(fullQuestions);
                setQuestions(fullQuestions);
            });
        });
    }, []);
    return (
        <>
            <Box sx={{ width: '100%' }}>
                <Grid
                    container rowSpacing={2}
                    alignItems="left"
                    justifyContent="left"
                >
                    <Grid item sx={{
                        margin: '1em',
                        width: '100%'
                    }}>
                        <Typography variant="h4">
                            Multiple Choice Questions
                        </Typography>
                        <form>
                            {questions.map((question: FullQuestionDto, index) => {
                                return (
                                    <Box key={index} sx={{ width: '100%', marginTop: '1em' }}>
                                        <QuestionCard {...{
                                            questionNumber: index + 1,
                                            questionText: question.text,
                                            questionSubject: question.subject,
                                            questionOptions: question.options,
                                        }} />
                                    </Box>
                                )
                            })}
                            <Button variant="contained" sx={{ marginTop: '1em' }}>
                                Submit
                            </Button>
                        </form>
                    </Grid>
                </Grid>
            </Box>
        </>
    );
}

export default QuestionsPage;
