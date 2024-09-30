"use client";
import Link from "next/link";
import React, { useState } from "react";
import { IoIosNotifications } from "react-icons/io";
import { aluno } from "@/app/mockData/Aluno";

const AlunoHome = () => {
  const [isNotificationVisible, setIsNotificationVisible] = useState(false);

  const handleNotificationClick = () => {
    setIsNotificationVisible(!isNotificationVisible);
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
            {/* Botao de notificacao */}
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
        <h1 className="text-3xl font-bold text-white mb-8">
          {"Seja bem vindo de volta " + aluno.nome}
        </h1>
        {/* Card de Notificacao */}
        {isNotificationVisible && (
          <div
            className="fixed top-0 left-0 w-full h-screen bg-gray-800 bg-opacity-50 flex justify-center items-center"
            onClick={handleNotificationClick}
          >
            <div className="bg-white p-4 rounded-md shadow-md w-full max-w-md">
              <h2 className="text-center text-lg font-semibold">
                Notificações
              </h2>
              {/*Conteudo da notificacao inserir aqui*/}
              <p>Voce não tem notificações...</p>
            </div>
          </div>
        )}
      </main>
    </>
  );
};

export default AlunoHome;
