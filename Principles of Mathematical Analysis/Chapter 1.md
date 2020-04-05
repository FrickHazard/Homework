16

Suppose $k \geq 3, x, y \in R^k, |\bold{x} - \bold{y}| = d > 0,$ and $r > 0$. Prove: 

($a$) If $2r > d$, there are infinitely many $\bold{z} \in R^k$ such that

$$| \bold{z} - \bold{x}| = | \bold{z} - \bold{y}| = r$$\

($b$) If $2r = d,$ there is exactly one such $\bold{z}$.\
($c$) If $2r < d,$ there is no such $\bold{z}$.\
How must these statements be modified if $k$ is $2$ or $1$?

Answer : 

($a$) SKIP


($b$)

$$|\bold{y} - \bold{x}| = |\bold{x} - \bold{y}| = d = 2r \iff$$
$$\frac{1}{2}|\bold{y} - \bold{x}|  = \frac{1}{2}|\bold{x} - \bold{y}| = r \iff$$ 
$$|\frac{\bold{y} - \bold{x}}{2}|  = |\frac{\bold{x} - \bold{y}}{2}| = r$$

Consider a  number $\bold{z}$ where $|\bold{z} - \bold{x}| = |\bold{z} - \bold{y}| = r$ by the above idenity we can easily construct this vector

$$|\frac{\bold{x}}{2} - \frac{\bold{y}}{2}| = r \iff |(\frac{\bold{x}}{2} + \frac{\bold{y}}{2}) - (\frac{\bold{y}}{2} + \frac{\bold{y}}{2})| = r \iff |(\frac{\bold{x} + \bold{y}}{2}) - \bold{y}|$$
$$|\frac{\bold{y}}{2} - \frac{\bold{x}}{2}| = r \iff |(\frac{\bold{y}}{2} + \frac{\bold{x}}{2}) - (\frac{\bold{x}}{2} + \frac{\bold{x}}{2})| = r \iff |(\frac{\bold{y} + \bold{x}}{2}) - \bold{x}|$$

So

$$\bold{z} = (\frac{\bold{y} + \bold{x}}{2})$$

($c$) SKIP
