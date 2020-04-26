package com.psob96.flutter_app

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterNativeView

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, "nativeChannel").setMethodCallHandler { call, result ->

            when (call.method){
                "emptyMethod" ->  {
                    result.success(null)
                }
                "getData" -> {
                    val size: Int = call.argument("size")!!
                    result.success(DataSource.getList(size))
                }
            }
        }
    }
}

object DataSource {

    val base = listOf(
            "Renae", "Paul", "Elowen", "Lily-Rose", "Hermione", "Faizaan", "Eesha",
            "Xavier", "Joyce", "Marshall", "Aneeka", "Clyde", "Huzaifah", "Lynda",
            "Herbert", "Curtis", "Bethan", "Jokubas", "Alyce", "Priya", "Ayah",
            "Judah", "Harvie", "Peter", "Rebecca", "Patsy", "Abdurahman", "Charleigh",
            "Serenity", "Rhia", "Ursula", "Abby", "Lex", "Abid", "Angela", "Saul",
            "Jimi", "Kennedy", "Izabel", "Teresa", "Khalil", "John", "Emil", "Umaiza",
            "Filip", "Dominick", "Paul", "Austin", "Bronwen", "Riaz", "Dollie",
            "Harriet", "Tamara", "Kali", "Momina", "Verity", "Zacharias", "Mariyah",
            "Milo", "Sayed", "Ethan", "Hamish", "Mercedes", "Shanice", "Antoine",
            "Sachin", "Julie", "Asiyah", "Steve", "Keeva", "Nicole", "Cecily",
            "Osman", "Samiya", "Carl", "Marcelina", "Enrique", "Marius", "Sid", "Arun",
            "Adrian", "Kealan", "Kayan", "Roxie", "Tayyab", "Kelsi", "Suraj", "Brian",
            "Sadiyah", "Iga", "Clifford", "Manha", "Harlee", "Muhammed", "Menaal",
            "Mia", "Conna", "Kris", "Reegan", "Blessing"
    )

    fun generateList(size: Int) : List<String>{

        val generatedList = mutableListOf<String>()

        for (i in 1 .. size / base.size)
            generatedList.addAll(base)

        return generatedList
    }

    fun getList(size: Int) : List<String>{

        return   when (size){
            100 -> list100
            1000 -> list1000
            10000 -> list10000
            else -> listOf()
        }
    }

    val list100 = generateList(100)
    val list1000 = generateList(1000)
    val list10000 = generateList(10000)

}
