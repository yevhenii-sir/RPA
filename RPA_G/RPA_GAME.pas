Program Rpg;
Uses Crt;
// Переменные
Var PlayerHeal,PlayerDamage, WeaponDamage, WeaponUp, diferent, BotleDamage, BotleWeapon:integer;
PlayerComand:string;
Weapons: array[1..2] of integer;
BotleHeal: array[1..3] of integer;
// процедуры
// процедура для вызова надписей команд 
// обучения 
procedure ConsoleHelp();
begin
 Writeln('Вся игра состоит из команд до главнои консоли');
 Writeln('Характеристики_игрока - показывает характеристику игрока ');
 Writeln('Инвентарь - показывает оружие и батончики которые есть в наличии');
 Writeln('Оружие - выбор оружия');
 Writeln('Качаться - увелечения урона для любого з оружий, но если есть баночек силы ');
 Writeln('Лечиться - Востановления здоровья игрока, в зависимости от баночки');
 Writeln('Бой - начатия боя з мобами ');
 Writeln('Не стоить запоминать все команды, если что-то забудешь напиши help в консоль');
end;

//пороцедура для вывода содержимого инвентаря
procedure Invent();
begin
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
  Writeln('Выберете баночку: ');
  Writeln('   Один - Маленькая +10');
  Writeln('   Два - Средняя   +30');
  Writeln('   Три - Большая   +75');
  Readln(PlayerComand);
  Case PlayerComand of
  'Один': If BotleHeal[1] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 10;
        BotleHeal[1]:= BotleHeal[1] - 1;
        Writeln('У вас осталося ',BotleHeal[1]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  'Два': If BotleHeal[2] > 0 then 
        begin
        PlayerHeal:= PlayerHeal + 30;
        BotleHeal[2]:= BotleHeal[2] - 1;
        Writeln('У вас осталося ',BotleHeal[2]);
        Writeln('У  ваш характеристика ',PlayerHeal);
        end;
  'Три': If BotleHeal[3] > 0 then 
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
        PlayerHeal:=100;
        PlayerDamage:=30;
        Weapons[1]:= 50;
        Weapons[2]:= 35;
        WeaponUp:= 8;
        BotleHeal[1]:= 3;
        BotleHeal[2]:= 2;
        BotleHeal[3]:= 2;
       end;
    2: begin
        PlayerHeal:= 90;
        PlayerDamage:=20;
        Weapons[1]:= 45;
        Weapons[2]:= 30;
        WeaponUp:= 5;
        BotleHeal[1]:= 2;
        BotleHeal[2]:= 1;
        BotleHeal[3]:=1;
       end;
    3: begin
        PlayerHeal:=70;
        PlayerDamage:=10;
        Weapons[1]:= 40;
        Weapons[2]:= 25;
        WeaponUp:= 3;
        BotleHeal[1]:= 2;
        BotleHeal[2]:= 1;
        BotleHeal[3]:= 0;
        end;
    else
      begin
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
// процедура выбора команды, главная процедура.
procedure Comand(ComandAnswer:string);
begin
  Case ComandAnswer of 
    'help': ConsoleHelp();
 
    'Характеристики_игрока':
    begin
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
    else Writeln('Ошибка');
  end;
end;

// Основная программа
begin
  //Главнвя переменая для урона теперь WeaponDamage
  PlayerDamage:= 5;
  Writeln('------------------');
  Writeln('НАЧАЛО');
  Writeln('------------------');
  Writeln('Вибирете уровень сложности');
  Writeln('1-легко');
  Writeln('2-нормальна');
  Writeln('3-тяжолоя');
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