
import './App.css';
import { useEffect, useState } from "react";


function App() {

  const [count, setCount] = useState(0);

  useEffect(() => {
    fetch("/hello")
      .then((r) => r.json())
      .then((data) => setCount(data.count));
  }, []);

  function getAlarms(e){
    fetch(`/alarms`).then((res)=>
    {
      
      if(res.ok)
      {res.json().then((alarms)=>console.log(alarms))}
      else
      {res.json().then((err)=>{alert(`${err.errors}`)})
    }
    })
  }

  return (
    <div className="App">
      <header className="App-header">
      <div className="App">
      <h1>Page Count: {count}</h1>
      <button onClick={()=>getAlarms()}>See Alarms</button>
    </div>
      </header>
    </div>
  );
}

export default App;
