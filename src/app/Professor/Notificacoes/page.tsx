import React from "react";
import Link from "next/link";

const page = () => {
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
            <li>
              <Link href="/Professor/Notificacoes">Notificações</Link>
            </li>
          </ul>
        </div>
      </nav>
      <main className="bg-[#7696D0] min-h-screen flex flex-col items-center justify-center"></main>
    </>
  );
};

export default page;
