import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
        style: TextStyle(color: Colors.white,
        fontSize: 35),),
        centerTitle: false,
        backgroundColor: Colors.lightGreen,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(borderRadius:BorderRadius.circular(25),
            child: Image.network("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAclBMVEX///98s0J0rzN3sTnT5cKx0Jdyri75/PeBtkfB2qnn8OB7sz7u9ef2+vF5sTz+//2NvF7k79pwrSrc6s+XwmzL4LfP4r2FuFHF3K6fx3mkyYDZ6Mu816P2+vKdxXmPvWGoy4atzpGEuE6Zw3C31J2Iuli3ASuSAAAF90lEQVR4nO2d6aKqLBhGE4xM1ByabDgNW+//Fr/yS01Qy7YonfOsH/tHSZsliDL4MpkAAAAAAAAAAAAAAAAAAODf5Wg7H6Vz7FnPOVHD7GJR7tud09k+p9b5CxxdixqG4bGgY7qAebd01HKV5KpP4rvgTTFddEo2S3mWjv5RlK/eWITG/5B5p3RT8kgXdjszw+Pkhgbp0txELE8WftZKDUhh6C3fT7QwCpi6rPXEjhZ5Nd9OdC4S0Z3CvPWDk19QBr++2/TvizQG1b6STiaHIrv08l6Ko8WLi3elNnO9sEjL/JY3xcXRsSNztd3Ot9uVGdnOsWwzy4rt/YyR486U7aLnZx/YZvLnZFHGCCGU0ttfxqh1+pPs7bumWRxvUP3v9xlPjc3KXcVXSqhXlGsB926fW/EqsMp29Bvq6J0ZLXwoI57k9oxHnlqZeOycv82KtDg18wXPpAXL9oKrh75//xyfgL4WEuHp2LnugHmVG5bXeNa3FKITs9c6tbD4K67"
                "EtfFBFX1AjfXY2X/N+dMCfBTjeWyBF7jLz24UJeSkdU110s9raA7daNy9cIxP7oMinqGtokM+uUnIcF07ie61jxK84220vBYXS/Ea5LeO0mvp27M3FcuennQccTuLrShN5+Z6J+VePAu7tTmXGihyHltHZh2KmUyyz51NmyJ/NJyJeHpC7W79rtjH9fLB66DtEaAY/I+F6sw93S7FWKxnLMq/8psLkfv5QZFUxzXrDptSQfGiDKbNTwE0yQ9ypdPQYbh1CFIpg10NpUaXd5zbUctavtbKkcSWWlqO/Eu19PYLOjU2lpx5en5819rShHlJ/9TcOK2RbGqQr0KjGBq0W/zuTc0xO+pS1yXR6EqsH3gi8dqOLrz9ju9dkyhYnWr7XF1mr9TiNDQlHmHkdW/qPhbecBa0eQI//L5TWE/HeWR1LPvpNMnoUk1dVUWozUyN+duhmWbYfmy5jJZnlt9Cp2PLZXw0SfEemsyYKvO7M7bcnZnY9e2TUId1bq3Pnb+l8/I4FeyppQ6qQ2O6mKlEpz4iAAAA8G8wi+bTZBsIN+HgMlXHRXhqWwTbZDqP1DytLuZXdl87yfzqIJ8ZUnWEwv/y2X39JrvOFTzruGneleekshZbYRffMEjFcFcMypG092E493k2l55GMTw9DSZ4pO8hHL/SkSdPK7gHM6yOi3snOZO/YStokPLNraEMbTEL2z4FF+L8UTHvMpzhWRjw4n6frY0t9eM3RYM9kOFsI37Hur8B2MxasiinFAYylCdHep1fnEs/X57"
                "AgQzlakT7nNWAIQxhCEMYwhCGMIQhDGEIQxjCEIYwhCEMYQhDGMIQhjCEIQxhCEMYwhCGMIQhDGEIw7/JcCsvKhvfsNfll7IFH3zlntrwLtLCwDJ0zmDrS6UQKf2+yi6GHqGHwQ3FyA09vwUtho/xyjcehjI8CieZRHUZ/ZxqrLLn1yAGW8luVl6pJm+GQ3+fnycRcnj6Yri3EQ5PzSlREChrmkdiobyy/HjAN0rWPM8CUxJswT4TxlhoJMfKxwMaTo4JD295IOc+F7FXJaNIehtnSMMbThQp02tgYMMRgCEMYTg+MIQhDMdnr9RQhwg8jtI4UVpETrwqNLyOLZchRaruj0pHdDyeNhXrGW7pEMxsorCt0aKdyVgzFaXImUahkoMN6zt4osdSHaLRlexjy+AP6ktEpPUow4q1qaElM/fB7CLH+wyObpVjIB1DL+VPjC3zAjmiKZfv3PJEhCbRSt8Bhhkw1BoYZsBQa2CYAUOtgWEGDLUGhhkw1BoYZsBQa2CYAUOt+fsNE2lJsSWv53UNadFvUvNbeiIFdOVpzVHSvpdabenYjrRPGa1b7iqNjGuyB9lb7ITM14b8Fd8voLuag3TFqe7k3LBDc3Vltbb7jddT2eGZNuwKu6hsVq3fLs7trMoJRXI6Nhzklrtzeo9tS7+IIA2px7lHwkNzZPFFEpL7QZT5ek2HvkcwXaZ+vGq"
                "fCpytYj9dTr/RDwAAAAAAAAAAAAAAAAAAoCP/AVjReU++0D37AAAAAElFTkSuQmCC",width: 50,
            height: 50,),
          ),
        ),




      ),
    );
  }
}
