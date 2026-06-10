

scoreHandling = function() {
    draw_text_transformed(500, 120, $"{correct}/8", 3, 3, 0);
}

answerOptionsText = function(answers) {
    for (var i = 0; i < array_length(answers); i++) {
        if (i < 4) {
            constant = 87 * i;
            draw_text(440, 339 + constant, answers[i]);
        } else {
            constant2 = 87 * (i - 4);
            draw_text(580, 339 + constant2, answers[i]);
        }
    }
}

checkAnswer = function(index, answers) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var hovering = false;
    var text_w = 65;
    var text_h = 28;
    
    for (var i = 0; i < array_length(answers); i++) {
        var text_x = 0;
        var text_y = 0;
        if (i < 4) {
            text_x = 430;
            text_y = 320 + (87 * i);
        } else {
            text_x = 570;
            text_y = 320 + (87 * (i - 4));
        }
        
        if (mx >= text_x && mx <= text_x + text_w && my >= text_y && my <= text_y + text_h) {
            hovering = true;
            if (mouse_check_button_pressed(mb_left)) {
                show_debug_message("You clicked on: " + answers[i]);
                if (answers[i] == answerKey[index]) {
                    correct++;
                    currentLevel++;
                    scoreHandling();
                } else {
                    correct = 0;
                    currentLevel = 1;
                    scoreHandling();
                    io_clear();
                }
            }
        }
    }
    
    if (hovering) {
        window_set_cursor(cr_handpoint);
    } else {
        window_set_cursor(cr_default);
    }
}

conclusion = function() {
    draw_sprite_ext(sPostItNote, 0, 73, 150, 28, 25, 0, c_white, true);
    draw_set_colour(c_black);
    draw_text_ext(150, 470, "you brighten up others' day\nlike the sun\nyou're very important,\ni hope i am too\nin every grey-ish day,\nyou always bring the fun\nMaking people smile,\nwhenever they feel blue\nTrust me, i follow a friendly approach\nPlease don't put my life to end\nThough I'm a cockroach\nI'm still your friend\n-Cockroach#67", 30, 330);
    window_set_cursor(cr_default);
    

}

level1 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "You brighten up others'");
    draw_text(100, 580, "day like the ___");
    var constant = 0;
    var constant2 = 0;
    answers = ["sun", "cloud", "rain", "pain", "sweet", "glass", "long", "tongue"];
    answerOptionsText(answers);
    checkAnswer(0, answers);
}

level2 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "You're very ____,'");
    draw_text(100, 580, "I hope I am too");
    var constant = 0;
    var constant2 = 0;
    answers = ["youthful", "red", "cute", "severe", "important", "painful", "small", "mean"];
    answerOptionsText(answers);
    checkAnswer(1, answers);
}

level3 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "in every ___-ish day,");
    draw_text(55, 580, "you always bring the fun");
    var constant = 0;
    var constant2 = 0;
    answers = ["weather", "fun", "take", "grey", "meaning", "sobbing", "table", "bread"];
    answerOptionsText(answers);
    checkAnswer(2, answers);
}

level4 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "Making people ___,");
    draw_text(60, 580, "whenever they feel blue");
    var constant = 0;
    var constant2 = 0;
    answers = ["take", "look", "body", "lose", "maneuver", "burden", "smile", "gain"];
    answerOptionsText(answers);
    checkAnswer(3, answers);
}

level5 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "____ me, I follow'");
    draw_text(100, 580, "a friendly approach");
    var constant = 0;
    var constant2 = 0;
    answers = ["youthful", "trust", "cute", "severe", "important", "painful", "small", "mean"];
    answerOptionsText(answers);
    checkAnswer(4, answers);
}

level6 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "Please don't put");
    draw_text(100, 580, "my ___ to end");
    var constant = 0;
    var constant2 = 0;
    answers = ["sadness", "information", "map", "family", "method", "bird", "problem", "life"];
    answerOptionsText(answers);
    checkAnswer(5, answers);
}

level7 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "Though I am a'");
    draw_text(100, 580, "_____");
    var constant = 0;
    var constant2 = 0;
    answers = ["ability", "economic", "teacher", "internet", "water", "area", "cockroach", "library"];
    answerOptionsText(answers);
    checkAnswer(6, answers);
}

level8 = function() {
    draw_sprite_ext(sSun, 0, 102, 290, 2.3, 2.3, 0, c_white, 1.0);
    draw_set_font(pixelfont);
    draw_set_colour(c_black);
    draw_text(69, 513, "I'm still your'");
    draw_text(100, 580, "____");
    var constant = 0;
    var constant2 = 0;
    answers = ["quality", "oven", "friend", "activity", "investment", "video", "lava", "mean"];
    answerOptionsText(answers);
    checkAnswer(7, answers);
}



// Handle player pressing Enter near the book
if (isNear) {
    if (keyboard_check_pressed(vk_enter)) {
        if (canDestroy) {
            instance_destroy(oBMissingBook);
            instance_destroy();
            isShowing = false;
            if (instance_exists(pause_id)) {
                instance_destroy(pause_id);
                pause_id = noone; 
            }
            finished = true;
            exit; 
        } else {
            isShowing = !isShowing; // Toggles UI on/off
        }
    }
}

// ONLY draw the puzzle if isShowing is actually TRUE
if (isShowing) {
    
    // 1. Draw the main book UI
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var scaleX = 256 * 3 / sprite_get_width(sOpenMissingBook);
    var scaleY = (240 * 3 - 180) / sprite_get_height(sOpenMissingBook);
    
    draw_sprite_ext(sOpenMissingBook, 0, 0, 180, scaleX, scaleY, 0, c_white, 1.0);

    // 2. Handle levels and scoring
    scoreHandling();
    switch (currentLevel) {
        case 1: level1(); break;
        case 2: level2(); break;
        case 3: level3(); break;
        case 4: level4(); break;
        case 5: level5(); break;
        case 6: level6(); break;
        case 7: level7(); break;
        case 8: level8(); break;
    }
    
    // 3. Check if player completed all 8 levels
    if (correct == 8) {
        if (!canDestroy) {
            canDestroy = true;
            var itemAdded = item_add_remote("Post-it", "X");
        }
        conclusion();
    }
}