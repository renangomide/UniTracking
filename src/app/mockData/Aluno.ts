export const aluno = {
  nome: "Renan",
  matricula: "201965187AB",
  turmas: [
    {
      id: "DCC117",
      nome: "Modelagem de Sistemas",
      turma: "A",
      faltas: [
        { date: "2024-03-12" },
        { date: "2024-04-05" },
        { date: "2024-05-10" },
      ],
    },
    {
      id: "DCC025",
      nome: "Orientacao a Objetos",
      turma: "B",
      faltas: [
        { date: "2024-03-15" },
        { date: "2024-04-07" },
        { date: "2024-05-20" },
        { date: "2024-06-03" },
      ],
    },
    {
      id: "DCC019",
      nome: "Linguagem de Programacao",
      turma: "A",
      faltas: [], // No absences for this class
    },
    {
      id: "DCC008",
      nome: "Calculo Numerico",
      turma: "B",
      faltas: [{ date: "2024-02-20" }, { date: "2024-03-18" }],
    },
  ],
};
