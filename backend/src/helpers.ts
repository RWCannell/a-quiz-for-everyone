export function generateRandomUniqueNumbers(arrayLength: number, max: number, min: number): number[] {
    const randomNumbers: number[] = [];

    while (randomNumbers.length < arrayLength) {
        let randomIndex: number = Math.floor(Math.random() * (max - min + 1)) + 1;
        if (!randomNumbers.includes(randomIndex)) {
            randomNumbers.push(randomIndex);
        }
    };
    return randomNumbers;
}