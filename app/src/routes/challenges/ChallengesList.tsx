import {useEffect, useState} from "preact/hooks";
import {Link} from "react-router-dom";

interface Question{
    title: string;
    number: number;
}

export default function ChallengesList(){
    const [data, setData] = useState([]);
    
    useEffect(() => {
        const fetchData = async () => {
            const res = await fetch("http://localhost:8080/getAllQuestions", {
                headers: {
                    "Content-Type": "application/json",
                    "Access-Control-Allow-Origin": "http://localhost:8080"
                },
                method: "GET"
            });
            const data = await res.json();
            setData(data);
        }
        fetchData();
    }, []);

    return(
        <div>
            <h1>problems list page</h1>
            <table style={{border: "2px solid grey"}}>
                <thead>
                    <tr>
                        <th style={{border: "2px solid grey"}}>Number</th>
                        <th style={{border: "2px solid grey"}}>Question</th>
                    </tr>
                </thead>
                <tbody>
                    {data.map((ques: Question) => (
                        <tr key={ques.number}>
                            <td style={{border: "2px solid grey"}}>{ques.number}</td>
                            <td style={{border: "2px solid grey"}}><Link to={`/challenges/${ques.number}`} end className='link'>{ques.title}</Link></td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
