import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import LaunchIcon from '@mui/icons-material/Launch';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';
import QuestionCard, { QuestionCardProps } from '../components/QuestionCard';

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
  return (
    <>
      <Box sx={{ width: '100%' }}>
        <Grid
          container rowSpacing={1}
          alignItems="left"
          justifyContent="left"
        >
          <Grid item>
            <Box sx={{ width: '100%' }}>
                <QuestionCard {
                    ...questionCardProps
                }
                />
            </Box>
          </Grid>
        </Grid>
      </Box>
    </>
  );
}

export default QuestionsPage;
