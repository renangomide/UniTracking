"use client";
import Link from "next/link";
import React, { useState } from "react";
import { aluno } from "@/app/mockData/Aluno";
import { IoIosNotifications } from "react-icons/io";
import Button from "@/components/button/button";

interface Turma {
  id: string;
  nome: string;
  turma: string;
  faltas: { date: string }[];
}

const AlunoTurmas = () => {
  const [isNotificationVisible, setIsNotificationVisible] = useState(false);
  const [selectedTurma, setSelectedTurma] = useState<Turma | null>(null);
  const [isContesting, setIsContesting] = useState<string | null>(null);
  const [contestText, setContestText] = useState("");

  const handleNotificationClick = () => {
    setIsNotificationVisible(!isNotificationVisible);
  };

  const handleTurmaClick = (turma: Turma) => {
    setSelectedTurma(turma);
    setIsContesting(null);
  };

  const handleCloseOverlay = () => {
    setSelectedTurma(null);
    setIsContesting(null);
    setContestText("");
  };

  const handleContestClick = (faltaDate: string) => {
    setIsContesting(faltaDate);
  };

  const handleTextChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    setContestText(e.target.value);
  };

  const handleSubmitContest = () => {
    console.log("Contest Submitted for date:", isContesting, contestText);
    handleCloseOverlay();
  };

  const handleReturnClick = () => {
    setIsContesting(null);
    setContestText("");
  };

  return (
    <>
      <nav className="fixed top-0 left-0 w-full bg-gray-800 text-white py-4">
        <div className="container mx-auto flex justify-center items-center">
          <ul className="flex space-x-16">
            <li>
              <Link href="/Aluno/Home">Home</Link>
            </li>
            <li>
              <Link href="/Aluno/Turmas">Turmas</Link>
            </li>
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
          {aluno.turmas.map((turma, index) => (
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
              <p>Você não tem notificações...</p>
            </div>
          </div>
        )}

        {/* Turma Details Overlay */}
        {selectedTurma && (
          <div
            className="fixed top-0 left-0 w-full h-screen bg-gray-800 bg-opacity-50 flex justify-center items-center"
            onClick={handleCloseOverlay}
          >
            <div
              className="bg-white p-6 rounded-md shadow-md w-full max-w-md"
              onClick={(e) => e.stopPropagation()} // previne fechamento quando clicando dentro do card
            >
              <h2 className="text-center text-xl font-semibold mb-4">
                {selectedTurma.nome} - {selectedTurma.turma}
              </h2>

              {/* Renderizando condicionalmente ou a list de faltas ou a contestacao da falta  */}
              {isContesting ? (
                <>
                  {/* Renderiza data da falta contestada */}
                  <p className="text-center">
                    Contestando falta de:{" "}
                    {new Date(isContesting).toLocaleDateString()}
                  </p>

                  {/* form para constestar */}
                  <textarea
                    className="w-full border border-gray-300 rounded p-2 mt-4"
                    rows={3}
                    placeholder="Digite o motivo para contestar a falta..."
                    value={contestText}
                    onChange={handleTextChange}
                  />
                  <div className="flex justify-center mt-4 space-x-4">
                    <Button
                      title="Enviar Contestação"
                      bgColor="#000000"
                      onClick={handleSubmitContest}
                    />
                    <Button
                      title="Voltar"
                      bgColor="#888888"
                      onClick={handleReturnClick}
                    />
                  </div>
                </>
              ) : (
                /* Renderiza a lista de faltas caso nenhuma esteja sendo constestada */
                <div className="space-y-4">
                  {selectedTurma.faltas.map((falta, index) => (
                    <div key={index} className="border-b pb-2">
                      <p className="text-center">
                        Falta em: {new Date(falta.date).toLocaleDateString()}
                      </p>
                      <div className="flex justify-center mt-2">
                        <Button
                          title="Contestar Falta"
                          bgColor="#E53935"
                          onClick={() => handleContestClick(falta.date)}
                        />
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
        )}
      </main>
    </>
  );
};

export default AlunoTurmas;
