"use client";
import React, { useState } from "react";
import Navbar from "@/components/navbar/navbar";
import Title from "@/components/title/title";
import Link from "next/link";
import Button from "@/components/button/button";
import { professor } from "@/app/mockData/Professor";
import { IoIosNotifications } from "react-icons/io";

const ProfessorHome = () => {
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
        <h1 className="text-3xl font-bold text-white mb-8">
          {"Seja bem vindo de volta " + professor.nome}
        </h1>
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
              <p>Notification content goes here...</p>
            </div>
          </div>
        )}
      </main>
    </>
  );
};

export default ProfessorHome;
