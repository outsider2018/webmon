$(function() {

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            date: '2018-06-14',
            good: 25,
            bad: 1
        }, {
            date: '2018-06-15',
            good: 25,
            bad: 1
        }, {
            date: '2018-06-16',
            good: 25,
            bad: 1
        }, {
            date: '2018-06-17',
            good: 24,
            bad: 2
        }, {
            date: '2018-06-18',
            good: 23,
            bad: 3
        }, {
            date: '2018-06-19',
            good: 25,
            bad: 1
        }, {
            date: '2018-06-20',
            good: 24,
            bad: 2
        }],
        xkey: 'date',
        ykeys: ['good', 'bad'],
        labels: ['Good', 'Bad'],
        barColors: ["#1AB244", "#B21516"],
        hideHover: 'auto',
        resize: true
    });
    
});
