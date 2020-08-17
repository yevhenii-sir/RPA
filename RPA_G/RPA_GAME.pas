Program Rpg;
Uses Crt;
// Переменные
Var PlayerHeal,PlayerDamage,diferent, BotleHeal, BotleDamage:integer;
PlayerComand:string;
// процедуры
// процедура для вызова надписей команд 
// обучения 
procedure ConsoleHelp();
begin
  Writeln('Вся игра состоит из команд до главнои консоли');
 Writeln('Характеристики_игрока - показывает характеристику игрока ');
 Writeln('Качаться - увелечения урона на 1, но если есть баночка силы ');
 Writeln('Лечиться - Востановления здоровья игрока, в зависимости от баночки');
 Writeln('Бой - начатия боя з мобами ');
 Writeln('Не стоить запоминать все команды, если что-то забудешь напиши help в консоль');
end;
// процедура для ввода команд
procedure Inp();
begin
  Writeln('Введите команду');
end;
// процедура для прокачки урона 
procedure UpDamage();
begin
  If BotleDamage > 0 then
    begin
      PlayerDamage:=PlayerDamage  + 1;
      BotleDamage:=BotleDamage - 1;
      Writeln('У вас осталося ',BotleDamage);
      Writeln('У  ваш характеристика ',PlayerDamage);
    end
   else
    begin
      Writeln('У вас нет нужного снаряжения');
    end;
end;
// процедура для личения
procedure UpHeal();
begin
  If BotleHeal > 0 then 
    begin
      PlayerHeal:= 100;
      BotleHeal:= BotleHeal - 1;
      Writeln('У вас осталося ',BotleHeal);
      Writeln('У  ваш характеристика ',PlayerHeal);
    end
end;

// процедура выбора уровни сложности 
Procedure differ(x:integer);
begin
  case x of 
    1: begin
        PlayerHeal:=100;
        PlayerDamage:=30;
       end;
    2: begin
        PlayerHeal:= 90;
        PlayerDamage:=20;
       end;
    3: begin
        PlayerHeal:=70;
        PlayerDamage:=10;
        end;
    else
      begin
        Writeln('Не правильно указано, был выбран 1 ваиант');
        PlayerHeal:=100;
        PlayerDamage:=30;
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
      Writeln('Урон игрока - ', PlayerDamage);
    end;
    
     'Качаться': UpDamage();
     
     'Лечиться': UpHeal();
     'Конец':conez();
    else Writeln('Ошибка');
  end;
end;

// Основная программа
begin
  BotleHeal:= 3;
  BotleDamage:=3;
  PlayerHeal:= 100;
  PlayerDamage:= 5;
  Writeln('------------------');
  Writeln('НАЧАЛО');
  Writeln('------------------');
  Writeln('Вибирете уровень сложности');
  Writeln('1-легко');
  Writeln('2-нормальна');
  Writeln('1-тяжолоя');
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