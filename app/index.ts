import fastify from 'fastify';
import { PrismaClient } from '@prisma/client';

const server = fastify();
const prisma = new PrismaClient();

server.get('/health', async (request, reply) => {
    return {
        healthStatus: 'healthy'
    };
});

server.get('/readiness', async (request, reply) => {
    return {
        readinessStatus: 'ready'
    };
});

// Initialize an array to store data (simulating a database)
const data: IFullQuestion[] = [
    {
        id: "abcdefgh",
        questionText: "What is the capital city of France?",
        subject: "GEOGRAPHY",
        correctOptionId: "xyz",
        options: [
            {
                option: "Milan",
                optionDescription: "Milan is in Italy, and it is not the capital city of Italy. Rome is the Italian capital",
            },
            {
                option: "Marseille",
                optionDescription: "Marseille is a city in France, but it's not the capital.",
            },
            {
                option: "Paris",
                optionDescription: "Paris is the capital city of France.",
            },
            {
                option: "Lyon",
                optionDescription: "Lyon is a city in France, but it's not the capital.",
            }
        ],
    }
];

server.get('/questions', (request, reply) => {
    reply.send(data);
});

server.register(require('@fastify/postgres'), {
    connectionString: 'postgres://postgres@localhost/postgres'
  })
  
  server.get('/user/:id', function (req, reply) {
    server.pg.query(
      'SELECT id, username, hash, salt FROM users WHERE id=$1', [req.params.id],
      function onResult (err, result) {
        reply.send(err || result)
      }
    )
  })

// Start the server
server.listen({ port: 3000 }, (err, address) => {
    if (err) {
        console.error(err)
        process.exit(1)
    }
    console.log(`Server is listening at ${address}`)
})