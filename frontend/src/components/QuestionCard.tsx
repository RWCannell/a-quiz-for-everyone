import * as React from 'react';
import Card from '@mui/material/Card';
import Box from '@mui/material/Box';
import Chip from '@mui/material/Chip';
import Stack from '@mui/material/Stack';
import Divider from '@mui/material/Divider';
import Typography from '@mui/material/Typography';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';
import Radio from '@mui/material/Radio';

export type QuestionCardProps = {
    questionNumber: number;
    questionSubject: string;
    questionText: string;
    questionOptions: string[];
};

function renderQuestionOptions(options: string[]) {
    return (
        <>
        {options.forEach((option: string) => {
            <FormControlLabel value={option} control={<Radio />} label={option} />
        })}
        </>
    );

}

function QuestionCard(questionCardProps: QuestionCardProps) {
  return (
    <Card variant="outlined" sx={{ maxWidth: 360 }}>
      <Box sx={{ p: 2 }}>
        <Stack direction="row" justifyContent="space-between" alignItems="center">
          <Typography gutterBottom variant="h5" component="div">
            Question {questionCardProps.questionNumber}
          </Typography>
          <Chip label={questionCardProps.questionSubject} size="small" />
        </Stack>
        <Typography color="text.secondary" variant="body2">
            {questionCardProps.questionText}
        </Typography>
      </Box>
      <Divider />
      <Box sx={{ p: 2 }}>
        {/* <Stack direction="row" spacing={1}>
          <Chip color="primary" label="Soft" size="small" />
          <Chip label="Medium" size="small" />
          <Chip label="Hard" size="small" />
          <Chip label="Hard" size="small" />
        </Stack> */}
        <FormControl>
            <FormLabel id="options-radio-buttons-group-label">Select correct answer:</FormLabel>
            <RadioGroup
                aria-labelledby="options-radio-buttons-group-label"
                defaultValue="New Orleans"
                name="options-radio-buttons-group"
            >
                { renderQuestionOptions(questionCardProps.questionOptions) }
            </RadioGroup>
            </FormControl>
      </Box>
    </Card>
  );
}

export default QuestionCard;