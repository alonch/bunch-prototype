<table class="table">
  <tr>
    <th>Punch</th>
    <th>System</th>
    <th>Tag</th>
    <th>Category</th>
    <th>Status</th>
    <th>Description</th>
    <th>Attendance</th>
    <th>Responsible</th>
  </tr>
  <tr ng-repeat="punch in getPunches()">
    <td>{[{punch.id}]}</td>
    <td>{[{punch.system}]}</td>
    <td>{[{punch.tag}]}</td>
    <td>{[{punch.category}]}</td>
    <td>{[{punch.statusText()}]}</td>
    <td>{[{punch.description}]}</td>
    <td>{[{punch.attendance}]}</td>
    <td>{[{punch.responsible}]}</td>
  </tr>
</table>