// Criando a colisão entre os inimigos
x -= dcos(point_direction(x, y, other.x, other.y))
y += dsin(point_direction(x, y, other.x, other.y))