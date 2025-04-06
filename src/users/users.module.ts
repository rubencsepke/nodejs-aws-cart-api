import { Module } from '@nestjs/common';

import { UsersService } from './services';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../entities/user.entity';
import { Cart } from '../entities/cart.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, Cart])],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
