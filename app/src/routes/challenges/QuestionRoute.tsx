import { useParams } from "react-router-dom";

export default function QuestionRoute(){
    const params = useParams();

    return(
        <div>
            <h1>Question {params.quesId}</h1>
        </div>
    );
}

