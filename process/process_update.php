<?php
error_reporting(E_ALL);
require_once "../classes/Todo.php";


if (isset($_GET['id'])) {
    $todo_id = $_GET['id'];

    $todo = new Todo();
    $isCompleted = $todo->completed($todo_id);

    if ($isCompleted) {
        $responseTodo = $todo->findById($todo_id);
        // print_r($responseTodo);
        // die();
        $status = $responseTodo->displayStatus();

        $html = "<tr>
            <td> $responseTodo->name</td>
            <td id='todo_status'>$status</td>
            <td>$responseTodo->created_at</td>
            <td>$responseTodo->completed_at</td>
            <td>";

        if ($status == 'Not Completed') {
            $html .= "<input type='hidden' class='todo_id' name='' value='$responseTodo->id'>
                      <button class='btn btn-primary mark_btn'>Mark as Completed</button>";
        }

        $html .= "</td>
            <td>";

        if ($status == 'Not Completed') {
            $html .= "<a href='create.php?id=$responseTodo->id'><i class='fa-solid fa-pen'></i></a>";
        }

        $html .= "</td>
            <td><a href='process/process_delete.php?id=$responseTodo->id'><i class='fa fa-trash text-danger'></i></a></td>
        </tr>";

        echo $html;
    }
}


