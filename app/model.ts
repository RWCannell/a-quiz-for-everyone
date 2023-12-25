interface IQuestion {
    id: string;
    questionText: string;
    subject: string;
    correctOptionId: string;
}

interface IOption {
    id: string;
    questionId: string;
    option: string;
    optionDescription: string;
}

interface IFullQuestion extends IQuestion {
    options: Partial<IOption>[];
}
