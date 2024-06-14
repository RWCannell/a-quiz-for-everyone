export interface Question {
    id: string;
    text: string;
    subject: boolean;
}

export interface Option {
    id: string;
    text: string;
}

export enum QuestionSubject {
    PHYSICS = "PHYSICS",
    CHEMISTRY = "CHEMISTRY",
    GEOGRAPHY = "GEOGRAPHY",
    BIOLOGY = "BIOLOGY",
    HISTORY = "HISTORY",
    LITERATURE = "LITERATURE",
    POP_CULTURE = "POP_CULTURE",
    INFORMATION_TECHNOLOGY = "INFORMATION_TECHNOLOGY"
}