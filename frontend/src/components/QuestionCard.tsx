import Card from '@mui/material/Card';
import Box from '@mui/material/Box';
import Chip from '@mui/material/Chip';
import Stack from '@mui/material/Stack';
import Divider from '@mui/material/Divider';
import Typography from '@mui/material/Typography';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import Radio from '@mui/material/Radio';
import { Option } from '../models/models';

export type QuestionCardProps = {
    questionNumber: number;
    questionSubject: string;
    questionText: string;
    questionOptions: Option[];
};

function QuestionCard(questionCardProps: QuestionCardProps) {
  return (
    <Card variant="outlined">
      <Box sx={{ p: 2 }}>
        <Stack direction="row" justifyContent="space-between" alignItems="center">
          <Typography gutterBottom variant="h5" component="div">
            Question {questionCardProps.questionNumber}
          </Typography>
          <Chip label={questionCardProps.questionSubject} size="small" />
        </Stack>
        <Typography variant="subtitle1">
            {questionCardProps.questionText}
        </Typography>
      </Box>
      <Divider />
      <Box sx={{ p: 2 }}>
        <FormControl>
            <RadioGroup
                aria-labelledby="options-radio-buttons-group-label"
                defaultValue=""
                name="options-radio-buttons-group"
            >
                {questionCardProps.questionOptions.map((option: Option, index) => {
                    return <FormControlLabel key={index} value={option.id} control={<Radio />} label={option.text} />
                })} 
            </RadioGroup>
            </FormControl>
      </Box>
    </Card>
  );
}

export default QuestionCard;