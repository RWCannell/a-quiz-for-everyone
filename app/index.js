"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fastify_1 = __importDefault(require("fastify"));
const server = (0, fastify_1.default)();
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
const data = [
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
// // Create route for adding an item (Create operation)
// server.post('/questions', (request, reply) => {
//     const newItem = request.body;
//     data.push(newItem);
//     reply.code(201).send(newItem);
// });
// // Create route for updating an item (Update operation)
// server.put('/questions/:id', (request, reply) => {
//     const { id } = request.params;
//     const updatedItem = request.body;
//     data[id] = updatedItem;
//     reply.send(updatedItem);
// });
// // Create route for deleting an item (Delete operation)
// server.delete('/questions/:id', (request, reply) => {
//     const { id } = request.params;
//     const deletedItem = data.splice(id, 1)[0];
//     reply.send(deletedItem);
// });
// Start the server
server.listen({ port: 3000 }, (err, address) => {
    if (err) {
        console.error(err);
        process.exit(1);
    }
    console.log(`Server is listening at ${address}`);
});
