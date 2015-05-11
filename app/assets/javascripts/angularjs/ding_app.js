(function() {
  var parkingLineApp = angularApplication.module('dingApp',
    []);

  parkingLineApp.controller('dingCtrl', ['$scope',
  function($scope) {
    $scope.model = {};
    $scope.model.origin_number = '';

    $scope.parse_number = function(origin_number) {
      var number = origin_number.replace(/,/g, '');
      return isNaN(number = parseInt(number, 10)) ? null : number;
    };

    $scope.to_east_number = function(number) {
      if (number == null)
        return null;
      else {
        var chinese_set = ['萬', '億', '兆', '京'],
            num_array = number.toString().replace(/\B(?=(\d{4})+(?!\d))/g, "|").split('|'),
            num_result = '';

        var cur = 0;
        for (var i = num_array.length-1; i >= 0; i--) {
          var num_real = $scope.parse_number(num_array[i]);
          if (i == num_array.length-1) {
            if (num_real > 0) {
              num_result = $scope.to_western_number(num_real) + num_result;
            }

          } else {
            if (num_real > 0) {
              num_result = $scope.to_western_number(num_real) + chinese_set[cur] + num_result;
            }
            cur++;
          }
        }

        return num_result;
      }
    };

    $scope.to_western_number = function(number) {
      if (number == null)
        return null;
      else
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    };

    $scope.copy_to_clipboard = function(number) {
      if (number != null)
        window.prompt("Copy to clipboard: Ctrl+C, Enter", number);
    };

  }]);
})();
