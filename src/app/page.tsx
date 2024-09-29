import Navbar from "@/components/navbar/navbar";
import Footer from "@/components/footer/footer";
import Card from "@/components/card/card";
import Title from "@/components/title/title";

export default function Home() {
  return (
    <div className="flex flex-col">
      <Navbar />
      <main className="py-10">
        <div className="flex flex-col items-center justify-center p-24">
          <Title text="Bem-vindo ao UniTracking" />
          <Card />
        </div>
      </main>
      <Footer />
    </div>
  );
}
