import "./styles/App.scss";
import Instructions from "./Components/Instructions/Instructions";
import PageHeader from "./Components/PageHeader/PageHeader";
import PageFooter from "./Components/PageFooter/PageFooter";

function App() {
  return (
    <div className="App">
      <PageHeader />
      <Instructions />
      <PageFooter />
    </div>
  );
}

export default App;
