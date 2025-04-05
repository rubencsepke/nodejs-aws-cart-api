import { forwardRef, Module } from '@nestjs/common';
import { OrderService } from './services';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Order } from '../entities/order.entity';
import { CartModule } from '../cart/cart.module';

@Module({
  imports: [TypeOrmModule.forFeature([Order]), forwardRef(() => CartModule)],
  providers: [OrderService],
  exports: [OrderService],
})
export class OrderModule {}
