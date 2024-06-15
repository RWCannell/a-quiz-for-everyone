import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import LaunchIcon from '@mui/icons-material/Launch';
import FormGroup from '@mui/material/FormGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';
import QuestionCard, { QuestionCardProps } from '../components/QuestionCard';
import { useState, useEffect } from 'react';

type QuestionOptionsDto = {
    id: string;
    questionText: string;
    questionSubject: string;
    questionOptions: string[];
};

const questions: QuestionOptionsDto[] = [
    {
        id: '1',
        questionText: 'What is the capital city of Louisana?',
        questionSubject: 'GEOGRAPHY',
        questionOptions: [
            'New Orleans',
            'Baton Rouge',
            'Lafayette',
            'Lake Charles'
        ],
    },
    {
        id: '2',
        questionText: 'What is the capital city of Norway?',
        questionSubject: 'GEOGRAPHY',
        questionOptions: [
            'Stockholm',
            'Helsinki',
            'Oslo',
            'Copenhagen'
        ],
    },
    {
        id: '3',
        questionText: 'What is the capital city of Morocco?',
        questionSubject: 'GEOGRAPHY',
        questionOptions: [
            'Marrakesh',
            'Rabat',
            'Tangier',
            'Casablanca'
        ],
    },
    {
        id: '4',
        questionText: 'What is the capital city of Brazil?',
        questionSubject: 'GEOGRAPHY',
        questionOptions: [
            'Brasilia',
            'Rio de Janiero',
            'Sao Paolo',
            'Salvador'
        ],
    }
];
const questionCardProps: QuestionCardProps = {
    questionNumber: 1,
    questionSubject: 'GEOGRAPHY',
    questionText: 'What is the capital city of Louisana?',
    questionOptions: [
        'New Orleans',
        'Baton Rouge',
        'Lafayette',
        'Lake Charles'
    ],
};
function QuestionsPage() {
    const [questions, setQuestions] = useState([]);
    useEffect(() => {
        fetch('http://localhost:4000/questions').then((response) => {
            const responseJson = response.json().then((res) => {
                console.log(res.responseBody);
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
                            {questions.map((question: QuestionOptionsDto, index) => {
                                return (
                                    <Box key={index} sx={{ width: '100%', marginTop: '1em' }}>
                                        <QuestionCard {...{
                                            questionNumber: index + 1,
                                            questionText: question.questionText,
                                            questionSubject: question.questionSubject,
                                            questionOptions: question.questionOptions,
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
