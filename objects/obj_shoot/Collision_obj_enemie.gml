if(bounce){
    aply_bounce();
    damage()
    other.damage();
}else {
	instance_destroy();
    other.damage();
}