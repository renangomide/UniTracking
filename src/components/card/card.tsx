import React from "react";
import Button from "@/components/button/button";
import Link from "next/link";

export default function Card() {
  return (
    <div className="bg-gray-300 shadow-lg rounded-lg p-16 max-w-sm mx-auto">
      <div className="flex flex-col justify-center items-center space-y-4">
        <Link href="/login-templates/login-aluno">
          <Button title="Entrar como Aluno" bgColor="#000000" />
        </Link>
        <Link href="/login-templates/login-professor">
          <Button title="Entrar como Professor" bgColor="#000000" />
        </Link>
      </div>
    </div>
  );
}
