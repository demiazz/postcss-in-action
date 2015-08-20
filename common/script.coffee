#= require shower-core/shower.min
#= require chartist

for link in document.querySelectorAll('a')
  link.target = '_blank' if link.attributes.href.value.match(/^http/)

progress = document.querySelector('.progress')
progressForCovers = ->
  if document.querySelector('.slide.active.cover')
    progress.classList.add('for-cover')
  else
    progress.classList.remove('for-cover')

window.addEventListener('hashchange', progressForCovers)
setTimeout(progressForCovers, 100)

# Charts

do ->
  data =
    labels: [ 'PostCSS', 'libsass', 'Less', 'Stylus', 'Ruby&nbsp;Sass' ]
    series: [ 37, 101, 141, 141, 805 ]
  options =
    distributeSeries: true
    horizontalBars: true,
    reverseData: true
    chartPadding:
      left: 30
      right: 20

  new Chartist.Bar('.chart.chart_performance', data, options)

do =>
  postcss = [
    120281, 146328, 188722, 228146, 251051, 245931, 307085,
    398741, 448137, 542148, 656468, 693696, 819367
  ]
  less    = [
    438283, 436719, 497304, 521737, 503559, 555681, 689054,
    697910, 799984, 903198, 929642, 982798, 1101597
  ]
  stylus  = [
    213678, 200661, 264798, 290863, 263608, 228548, 257720,
    298196, 346317, 352380, 316110, 311119, 373889
  ]

  data =
    labels: [
      '07/14', '08/14', '09/14', '10/14', '11/14', '12/14', '01/15',
      '02/15', '03/15', '04/15', '05/15', '06/15', '07/15']
    series: [
      {
        name: 'PostCSS',
        data: postcss
      },
      {
        name: 'Less.js',
        data: less
      },
      {
        name: 'Stylus',
        data: stylus
      }
    ]
  options =
    showArea:  true
    showPoint: false
    chartPadding:
      left: 20

  new Chartist.Line('.chart.chart_downloads', data, options)
