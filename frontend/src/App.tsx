import './App.css';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import LaunchIcon from '@mui/icons-material/Launch';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';

function App() {
  return (
    <>
      <Box sx={{ width: '100%' }}>
        <Grid
          container rowSpacing={1}
          alignItems="center"
          justifyContent="center"
        >
          <Grid item>
            <Box sx={{ width: '100%' }}>
              <Typography variant="h1" gutterBottom>
                A Quiz for Everyone
              </Typography>
              <Typography variant="h4" gutterBottom>
                Test yourself in a challenging general knowledge quiz...
              </Typography>
              <Box sx={{ textAlign: 'center' }}>
                <Button variant="contained" endIcon={<LaunchIcon />}>
                  Start Quiz
                </Button>
              </Box>
            </Box>
          </Grid>
        </Grid>
      </Box>
    </>
  );
}

export default App;
