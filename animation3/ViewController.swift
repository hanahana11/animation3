//
//  ViewController.swift
//  animation3
//
//  Created by 末利　花 on 2019/01/02.
//  Copyright © 2019年 末利　花. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    var chart: CombinedChartView!
    var lineDateSet: LineChartDataSet!
    var bubbleDateSet: BubbleChartDataSet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    let combineDate = CombinedChartData()
    
        combineDate.lineData = generateLineData()
        
    chart = CombinedChartView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
        
        chart.data = combineDate
        
        self.view.addSubview(chart)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    func generateLineData() -> LineChartData {
        let values: [Double] = [0,254,321,512,214,444,967,101,765,228,726,253,20,123,512,448,
                                557,223,465,291,979,134,864,481,405,711,1106,411,455,761]
        
        let values2: [Double] = [201,220,203,420,520,620,720,820,920,200,201,220,203,420,520,
                                 657,757,857,579,570,571,572,573,574,575,576,577,578,579,571]
        
        let date: [Double] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
        
        let date2: [Double] = [1,5,3,7,9,14,16,17,18,20,21,24,25,26,27,28,29,30,32,36,40,41,42,43,44,45,46,47,48,49]
        
        var entries: [ChartDataEntry] = Array()

        for (i, value)in values.enumerated(){
            
            entries.append(ChartDataEntry(x: date[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder),compatibleWith: nil)))
        
    }
    
        var entries2: [ChartDataEntry] = Array()

        for (i, value) in values2.enumerated(){
        
        entries2.append(ChartDataEntry(x: date2[i], y: value, icon: UIImage(named: "icon", in:  Bundle(for: self.classForCoder), compatibleWith: nil)))
        }
        
        var linedata: [LineChartDataSet] = Array()

        lineDateSet = LineChartDataSet(values: entries, label: "Line chart unit test data")
        
        lineDateSet.drawIconsEnabled = false
        lineDateSet.colors = [NSUIColor.red]
        lineDateSet.circleColors = [NSUIColor.red]
        
        linedata.append(lineDateSet)
        
        lineDateSet = LineChartDataSet(values: entries2, label: "test data2")
        
        lineDateSet.drawIconsEnabled = false
        lineDateSet.colors = [NSUIColor.blue]
        lineDateSet.circleColors = [NSUIColor.blue]
        
        linedata.append(lineDateSet)
        
    return LineChartData(dataSets: linedata)
        
    }

    //バブルチャートの描画
    func generateBubbleData() -> BubbleChartData
    {
        //データ設定
        let values: [Double] = [0, 24, 221, 52, 21, 44, 97, 11, 76, 28,
                                76, 53, 20, 13, 51, 482, 57, 22, 65, 21,
                                79, 324, 86, 48, 25, 11, 16, 41, 55, 71]
        let values1: [Double] = [221,225,263,720,120,520,120,220,420,100,
                                 101,250,223,820,420,857,257,257,879,270,
                                 275,552,273,374,275,376,477,878,279,1]
        
        //線グラフと同じ構成をしているため同じ様な文
        //線グラフではしていないリストの初期化をすることでentriesの数を減らした
        var entries: [ChartDataEntry] = Array()
        var setData: [BubbleChartDataSet] = Array()
        
        //valuesの中身がなくなるまで回り続ける( enumerated() )
        for (i, value) in values.enumerated()
        {
            //BubblwChartDataEntryの中身は、(x,y,size)の三つを設定する必要がある
            entries.append(BubbleChartDataEntry(x: Double(i), y: value, size: CGFloat(values1[i]) ))
            
        }
        
        //データの中身とラベルの設定
        bubbleDateSet = BubbleChartDataSet(values: entries, label: "bubble")
        //色の設定
        bubbleDateSet.colors = [NSUIColor.yellow]
        //上で作ったデータを
        setData.append(bubbleDateSet)
        
        //リストを一度初期化するともう一度使える
        entries.removeAll()
        
        //上に同じ、データは適当に変える
        for (i, value) in values1.enumerated()
        {
            entries.append(BubbleChartDataEntry(x: Double(i), y: value, size: CGFloat(values[i]) ))
            
        }
        bubbleDateSet = BubbleChartDataSet(values: entries, label: "bubble2")
        bubbleDateSet.colors = [NSUIColor.green]
        setData.append(bubbleDateSet)
        
        //一つだけのデータを表示させたいならこっちでもいい（複数のデータ表示ができない）
        //return BubbleChartData(dataSet: bubbleDataSet)
        
        //複数のデータを表示させるためにdataSetsにしている
        return BubbleChartData(dataSets: setData)
        
    }
}
