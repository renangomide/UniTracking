"use client";

import Button from "@/components/button/button";
import Link from "next/link";
import React, { useState } from "react";
import { professor } from "@/app/mockData/Professor";
import { IoIosNotifications } from "react-icons/io";

const ProfessorTurma = () => {
  const [selectedTurma, setSelectedTurma] = useState<any>(null);
  const [isChamadaActive, setIsChamadaActive] = useState(false);
  const [alunosRestantes, setAlunosRestantes] = useState<string[]>([]);
  const [isNotificationVisible, setIsNotificationVisible] = useState(false);

  // Function to handle turma selection and toggle
  const handleTurmaClick = (turma: any) => {
    if (selectedTurma && selectedTurma.id === turma.id) {
      // If the same turma is clicked, close the card
      setSelectedTurma(null);
      setIsChamadaActive(false);
      setAlunosRestantes([]); // Reset students list when turma is closed
    } else {
      // Otherwise, open the selected turma and reset states
      setSelectedTurma(turma);
      setIsChamadaActive(false);
      setAlunosRestantes(turma.alunos); // Initialize students list
    }
  };

  // Function to handle "Fazer Chamada" click
  const handleFazerChamada = () => {
    setIsChamadaActive(true);
  };

  // Function to mark a student as present or absent and remove them from the list
  const handleAttendance = (index: number) => {
    const updatedAlunos = alunosRestantes.filter((_, i) => i !== index);
    setAlunosRestantes(updatedAlunos); // Update the remaining students
  };
  const handleNotificationClick = () => {
    setIsNotificationVisible(!isNotificationVisible);
  };

  return (
    <>
      <nav className="fixed top-0 left-0 w-full bg-gray-800 text-white py-4">
        <div className="container mx-auto flex justify-center items-center">
          <ul className="flex space-x-16">
            <li>
              <Link href="/Professor/Home">Home</Link>
            </li>
            <li>
              <Link href="/Professor/Turmas">Turmas</Link>
            </li>
            {/* Notification Button */}
            <button
              onClick={handleNotificationClick}
              className="text-white text-2xl"
            >
              <IoIosNotifications />
            </button>
          </ul>
        </div>
      </nav>
      <main className="bg-[#7696D0] min-h-screen flex flex-col items-center justify-center">
        <div className="flex flex-col space-y-4 p-4 w-full max-w-md">
          {/* Render list of turmas */}
          {professor.turmas.map((turma, index) => (
            <div
              className="w-full h-12 flex items-center justify-center"
              key={index}
            >
              <Button
                title={turma.nome + ": " + turma.turma}
                bgColor="#000000"
                onClick={() => handleTurmaClick(turma)}
              />
            </div>
          ))}

          {/* Render the selected Turma with the "Fazer Chamada" button */}
          {selectedTurma && (
            <div className="w-full bg-white p-4 rounded-md shadow-md mt-4">
              <h2 className="text-center text-lg font-semibold">
                {selectedTurma.nome} - {selectedTurma.turma}
              </h2>
              {!isChamadaActive ? (
                <div className="flex justify-center mt-4">
                  <Button
                    title="Fazer Chamada"
                    bgColor="#000000"
                    onClick={handleFazerChamada}
                  />
                </div>
              ) : (
                <div className="mt-4">
                  {/* Render list of remaining students for the selected turma */}
                  {alunosRestantes.length > 0 ? (
                    alunosRestantes.map((aluno: string, index: number) => (
                      <div
                        key={index}
                        className="flex justify-between items-center mb-2 p-2 border border-gray-300 rounded-md"
                      >
                        <span>{aluno}</span>
                        <div>
                          {/* Two buttons for marking presence or absence */}
                          <button
                            className="bg-green-500 text-white px-2 py-1 mr-2 rounded"
                            onClick={() => handleAttendance(index)}
                          >
                            Presente
                          </button>
                          <button
                            className="bg-red-500 text-white px-2 py-1 rounded"
                            onClick={() => handleAttendance(index)}
                          >
                            Ausente
                          </button>
                        </div>
                      </div>
                    ))
                  ) : (
                    <p className="text-center text-gray-600">
                      Todos os alunos foram marcados!
                    </p>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
        {/* Notification Card */}
        {isNotificationVisible && (
          <div
            className="fixed top-0 left-0 w-full h-screen bg-gray-800 bg-opacity-50 flex justify-center items-center"
            onClick={handleNotificationClick}
          >
            <div className="bg-white p-4 rounded-md shadow-md w-full max-w-md">
              <h2 className="text-center text-lg font-semibold">
                Notificações
              </h2>
              {/* Add your notification content here */}
              <p>Voce não tem notificações...</p>
            </div>
          </div>
        )}
      </main>
    </>
  );
};

export default ProfessorTurma;
