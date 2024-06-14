export function generateRandomUniqueNumbers(arrayLength: number, max: number, min: number): number[] {
    const randomArrayOfIndices: number[] = [];

    while (randomArrayOfIndices.length < arrayLength) {
        let randomIndex: number = Math.floor(Math.random() * (max - min + 1)) + 1;
        if (!randomArrayOfIndices.includes(randomIndex)) {
            randomArrayOfIndices.push(randomIndex);
        }
    };
    return randomArrayOfIndices;
}