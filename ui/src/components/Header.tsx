import { LucideIcon } from "lucide-react";

interface HeaderProps {
  Title: string;
  description: string;
  icon?: LucideIcon;
}

const Header = ({ Title: title, description, icon: Icon }: HeaderProps) => {
  return (
    <div className="flex flex-row gap-2">
      {Icon && (
        <Icon className="w-5 h-5 p-5 rounded-full bg-blue-500 opacity-75" />
      )}
      <div className="flex flex-col">
        <h1 className="text-3xl font-bold text-white">{title}</h1>
        <p className="text-sm font-normal text-white/60">{description}</p>
      </div>
    </div>
  );
};

export default Header;
