import React from "react";

interface ButtonProps {
  title: string;
  bgColor: string;
  onClick?: () => void;
}

const Button: React.FC<ButtonProps> = ({ title, bgColor, onClick }) => {
  return (
    <button
      onClick={onClick}
      style={{ backgroundColor: bgColor }}
      className="px-4 py-3 text-white rounded-lg text-lg font-semibold hover:bg-opacity-90 transition duration-300"
    >
      {title}
    </button>
  );
};

export default Button;
