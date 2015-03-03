<table class="table" >
  <tr>
    <th>Punch</th>
    <th>System</th>
    <th>Tag</th>
    <th>Category</th>
    <th>Status</th>
    <th>Description</th>
    <th>Attendance</th>
    <th>Responsible</th>
    <th ng-show="arePunchesModifiable()"></th>
  </tr>
  <tr ng-repeat="punch in getPunches()">
    <td>{[{punch.id}]}</td>
    <td>{[{punch.system}]}</td>
    <td>{[{punch.tag}]}</td>
    <td>{[{punch.category}]}</td>
    <td>{[{punch.statusText()}]}
      <small ng-hide="punch.status">
        <br>by: {[{punch.modifiedBy}]}<br>on: {[{punch.modified}]}
      </small>
    </td>
    <td>{[{punch.description}]}</td>
    <td>{[{punch.attendance}]}</td>
    <td>{[{punch.responsible}]}</td>
    <td><button ng-show="punch.status && arePunchesModifiable()" class="btn btn-danger btn-sm" ng-click="punch.close()">Close</button></td>
  </tr>
</table>