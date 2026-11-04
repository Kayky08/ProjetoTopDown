// Se destruindo quando entra em contato com uma das mãos
instance_destroy();

// Trocando os status da mão
other.state         = "normal";
other.time_recharge = recharge_time;
other.shoot         = shoot;
other.icon          = icon;