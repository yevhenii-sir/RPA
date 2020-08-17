Program Rpg;
Uses Crt;
// Переменные
Var PlayerHeal,PlayerDamage, WeaponDamage, WeaponUp, diferent, BotleDamage, BotleWeapon:integer;
PlayerComand:string;
number, num: integer;
Weapons: array[1..2] of integer;
BotleHeal: array[1..3] of integer;
TextCL: array[1..7, 1..2] of integer;
// процедуры
// процедура для вызова надписей команд 
// обучения 
//Все мобы

//**Здоровый волк**
//Уровень моба: низький 
//Здоровье: 100
//Урон 10
// Ключ моба = 1 (numberMob)


// процедура боя между игроком и мобом
procedure Fight(numberMob:integer);
begin
var damageMob,healMob:integer;
var fightComand, nameMob:string;
 TextColor(TextCL[7,1]);
 case numberMob of 
      1:begin 
          Writeln('Вы встретили Здорового волка');
          nameMob:= 'Здоровый волк';
          damageMob:= 10;
          healMob:= 100;
          Writeln('Ваши действия:');
          Writeln('    Атаковать');
          Writeln('    Лечиться');
          Readln(fightComand);
          
          case fightComand of 
            'Атаковать':
              begin
                repeat
                  healMob:= healMob - WeaponDamage ;
                  Writeln('Вы атакуете,');
                  Writeln('У противника осталось ', healMob);
                    if (healMob = 0) or (healMob < 0) then
                      begin
                        break;
                      end;
                  Writeln('Противник атакает в ответ ');
                  PlayerHeal:= PlayerHeal - damageMob;
                  Writeln('У вас осталося ',PlayerHeal, ' Здоровья');
                until (PlayerHeal = 0) or (healMob = 0);
                if PlayerHeal > healMob then
                  begin
                    Writeln('Игрок одержал победу');
                  end
                else
                  begin
                    Writeln(nameMob,'Одержал победу');
                  end;
              end;
           end;
         end;
 end;
end;

//процедура для смены цвета
procedure chooseColor(var x, y:integer);
  var i: integer;
  begin
  for i:= 1 to 2 do begin
  TextCL[x,i]:= y;
  end;
  end;

// процедура для выбора места приминеня цвета
Procedure SelectColor();
begin
Writeln('Где вы хотите изменить цвет?'); 
Writeln('1 - Главное меню');
Writeln('2 - Характеристики');
Writeln('3 - Инвентарь');
Writeln('4 - Оружие');
Writeln('5 - Качаться');
Writeln('6 - Лечиться');
Writeln('7 - Бой');
Readln(number);
Writeln('Выбирите цвет: ');
Writeln('1 - LightBlue');
Writeln('2 - Red');
Writeln('3 - Magenta');
Writeln('4 - Yellow');
Writeln('5 - LightGray');
Readln(num);
Case num of
1: begin
    num:= 9;
    chooseColor(number,num);
  end;
2: begin
    num:= 4;
    chooseColor(number,num);
    end;
3: begin
    num:= 5;
    chooseColor(number,num);
    end;
4: begin
    num:= 14;
    chooseColor(number,num);
    end;
5: begin
    num:= 7;
    chooseColor(number,num);
    end;
end;
end;

//процедура старту игры
procedure starting();
var i, n: integer;
begin
  for i:= 1 to 6 do 
      begin
        for n:=1 to 2 do begin
        TextCL[i,n] := White; //изначальный цвет текста
        end;
      end;
  TextColor(White);
  PlayerDamage:= 5;
  Writeln('------------------');
  Writeln('НАЧАЛО');
  Writeln('------------------');
  Writeln('Вибирете уровень сложности');
  Writeln('1-легко');
  Writeln('2-нормальна');
  Writeln('3-тяжолоя');
end;

procedure ConsoleHelp();
begin
 TextColor(TextCL[1,1]);
 Writeln('Вся игра состоит из команд до главнои консоли');
 Writeln('Характеристики_игрока - показывает характеристику игрока ');
 Writeln('Инвентарь - показывает оружие и батончики которые есть в наличии');
 Writeln('Оружие - выбор оружия');
 Writeln('Качаться - увелечения урона для любого з оружий, но если есть баночек силы ');
 Writeln('Лечиться - Востановления здоровья игрока, в зависимости от баночки');
 Writeln('Бой - начатия боя з мобами ');
 Writeln('Не стоить запоминать все команды, если что-то забудешь напиши help в консоль');
 Writeln('Очистить - очищает екран, от всех событий(текста)');
 Writeln('Сменить_цвет - позволяет выбрать цвет текста');
end;

//пороцедура для вывода содержимого инвентаря
procedure Invent();
begin
  TextColor(TextCL[3,1]);
  Writeln('Оружие: ');
  Writeln('    Меч');
  Writeln('    Кинжал');
  Writeln('Батончики: ');
  Writeln('    Количество баночек силы: ', BotleDamage);
  Writeln('    Кол-во баночек здоровья: '); 
  Writeln('           Маленькая -', BotleHeal[1]);
  Writeln('           Cредняя - ', BotleHeal[2]);
  Writeln('           Большая - ', BotleHeal[3]);
  Writeln('    Кол-во баночек силы оружия: ', BotleWeapon);
end;

//процедура для обновления показаний урона для кулаков
procedure fist();
begin
  if WeaponDamage = PlayerDamage - 1 then
    begin
      WeaponDamage:= PlayerDamage;
    end;
end;

//процедура для увеличения урона в оружия
procedure UpDamageWeap();
  begin
    TextColor(TextCL[5,1]);
    Writeln('Выбирите оружие которое вам нужно улутшить: ');
    Writeln('   Меч - ', Weapons[1], 'урона       +', WeaponUp);
    Writeln('   Кинжал - ', Weapons[2], ' урона   +', WeaponUp);
    Writeln('   Кулаки - ', PlayerDamage, ' урона   +1');
    Readln(PlayerComand);
    Case PlayerComand of
      'Меч': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[1] := Weapons[1] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[1];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('У  ваc характеристика: ',Weapons[1]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
   'Кинжал': Begin 
        If BotleWeapon > 0 then
          begin
          Weapons[2] := Weapons[2] + WeaponUp;
          BotleWeapon:= BotleWeapon - 1;
          WeaponDamage := Weapons[1];
          Writeln('У вас осталося: ',BotleWeapon);
          Writeln('У  ваc характеристика: ',Weapons[2]);
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
      end;
   'Кулаки': Begin
        If BotleDamage > 0 then
          begin
          PlayerDamage:=PlayerDamage  + 1;
          BotleDamage:=BotleDamage - 1;
          Writeln('У вас осталося: ',BotleDamage);
          Writeln('У  ваc характеристика: ',PlayerDamage);
          fist();
          end
        else
          begin
          Writeln('У вас нет нужного снаряжения');
          end;
          end;
    else Writeln('Ошибка');
      end;
    end;

//процедура для выбора оружия
procedure weapon();
begin
  TextColor(TextCL[4,1]);
  Writeln('Выбирите оружие: ');
  Writeln('   Меч - ', Weapons[1], 'урона');
  Writeln('   Кинжал - ', Weapons[2], ' урона');
//PlayerDamage это урон от кулаков
  Writeln('   Кулаки - ', PlayerDamage, ' урона');
  Write('Введите названия оружия: ');
  Readln(PlayerComand);
  Case PlayerComand of
    'Меч': WeaponDamage:= Weapons[1];
    'Кинжал': WeaponDamage:= Weapons[2];
    'Кулаки': WeaponDamage:= PlayerDamage;
  else Begin 
    Writeln('Вы выбрали неправильно! Автоматически установлен Меч');
    WeaponDamage:= Weapons[1];
    end;
  end;
  Writeln('Теперь ваш урон составляєт: ', WeaponDamage);
end; 

procedure Inp();
begin
  Writeln('Введите команду');
end;

// процедура для личения
procedure UpHeal();
begin
  TextColor(TextCL[6,1]);
  Writeln('Выберете баночку: ');
  Writeln('   1 - Маленькая +10');
  Writeln('   2 - Средняя   +30');
  Writeln('   3 - Большая   +75');
  Readln(number);
  Case number of
  1: If BotleHeal[1] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 10;
        BotleHeal[1]:= BotleHeal[1] - 1;
        Writeln('У вас осталося ',BotleHeal[1]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  2: If BotleHeal[2] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 30;
        BotleHeal[2]:= BotleHeal[2] - 1;
        Writeln('У вас осталося ',BotleHeal[2]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  3: If BotleHeal[3] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 75;
        BotleHeal[3]:= BotleHeal[3] - 1;
        Writeln('У вас осталося ',BotleHeal[3]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  else Writeln('Ошибка');
  end;
end;

// процедура выбора уровни сложности 
Procedure differ(x:integer);
begin
  case x of 
    1: begin
    TextColor(Red);
        PlayerHeal:=100;
        PlayerDamage:=30;
        Weapons[1]:= 50;
        Weapons[2]:= 35;
        WeaponUp:= 8;
        BotleHeal[1]:= 3;
        BotleHeal[2]:= 2;
        BotleHeal[3]:= 2;
        ClrScr();
        Writeln('Вы выбрали легкий уровень сложности');
       end;
    2: begin
    TextColor(Red);
        PlayerHeal:= 90;
        PlayerDamage:=20;
        Weapons[1]:= 45;
        Weapons[2]:= 30;
        WeaponUp:= 5;
        BotleHeal[1]:= 2;
        BotleHeal[2]:= 1;
        BotleHeal[3]:=1;
        ClrScr();
        Writeln('Вы выбрали средний уровень сложности');
       end;
    3: begin
    TextColor(Red);
        PlayerHeal:=70;
        PlayerDamage:=10;
        Weapons[1]:= 40;
        Weapons[2]:= 25;
        WeaponUp:= 3;
        BotleHeal[1]:= 2;
        BotleHeal[2]:= 1;
        BotleHeal[3]:= 0;
        ClrScr();
        Writeln('Вы выбрали тяжолый уровень сложности');
        end;
    else
      begin
      TextColor(Red);
        Writeln('Не правильно указано, был выбран 1 ваиант');
        PlayerHeal:=100;
        PlayerDamage:=30;
        Weapons[1]:= 50;
        Weapons[2]:= 35;
        WeaponUp:= 8;
        BotleHeal[1]:= 3;
        BotleHeal[2]:= 2;
        BotleHeal[3]:= 2;
      end;
   end;
end;

//процедура для виходу
procedure conez();
begin
  exit;
end;
// процедура для очистки екрана
Procedure cleanerText();
begin
  ClrScr();
end;
// процедура выбора команды, главная процедура.
procedure Comand(ComandAnswer:string);
begin
  Case ComandAnswer of 
    'help': ConsoleHelp();
    'Характеристики_игрока':
    begin
    TextColor(TextCL[2,1]);
      Writeln('Здоровье игрока - ', PlayerHeal);
      if WeaponDamage = 0 then
        begin
          WeaponDamage:= PlayerDamage;
        end;
      Writeln('Урон игрока - ', WeaponDamage);
    end;
     'Качаться': UpDamageWeap();
     'Инвентарь': Invent();
     'Оружие': weapon();
     'Лечиться': UpHeal();
     'Конец':conez();
     'Очистить':cleanerText();
     'Сменить_цвет':SelectColor();
    else Writeln('Ошибка');
  end;
end;

// Основная программа
begin
 starting();
 Readln(diferent);
 differ(diferent);
 Writeln('Начнём наше путишествия');
 Writeln('обучения');
 ConsoleHelp();
 Writeln('Обучения завершено');
 Writeln('Начало'); 
 repeat
  Inp();
  Readln(PlayerComand);
  Comand(PlayerComand);
 until PlayerHeal < 0;
 
end.