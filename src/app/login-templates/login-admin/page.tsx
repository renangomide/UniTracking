// pages/login-aluno.tsx
import Button from "@/components/button/button";

const LoginProfessor = () => {
  return (
    <main className="bg-[#F55C48] min-h-screen flex flex-col items-center justify-center">
      <h1 className="text-3xl font-bold text-white mb-8">
        Você está entrando como <strong>Admin</strong>
      </h1>
      <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
        <form className="flex flex-col space-y-4">
          <div className="mb-4">
            <label
              htmlFor="username"
              className="block text-gray-700 text-sm font-bold mb-2"
            >
              Nome de Usuário
            </label>
            <input
              id="username"
              type="text"
              placeholder="Digite seu nome de usuário"
              className="w-full px-3 py-2 border border-gray-300 rounded"
            />
          </div>
          <div className="mb-4">
            <label
              htmlFor="password"
              className="block text-gray-700 text-sm font-bold mb-2"
            >
              Senha
            </label>
            <input
              id="password"
              type="password"
              placeholder="Digite sua senha"
              className="w-full px-3 py-2 border border-gray-300 rounded"
            />
          </div>
          <div className="flex justify-center">
            <Button title="Login" bgColor="#490A08" />
          </div>
        </form>
      </div>
    </main>
  );
};

export default LoginProfessor;
