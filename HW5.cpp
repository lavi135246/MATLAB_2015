#include "mex.h"
#include "matrix.h"
#include <queue>
#include <vector>

using namespace std;

struct point{
	int dist;
	int parent;
};

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){
    
    if ( nrhs!=3 || nlhs!= 1){
    	mexErrMsgTxt("Wrong input or output!");
    }
	
	/*先把input用好*/
	//長寬 和 陣列 
	int m=mxGetM(prhs[0]);	
    int n=mxGetN(prhs[0]);
    //起點 終點
	double* start_p = mxGetPr(prhs[1]);
	double* goal_p = mxGetPr(prhs[2]);
    double* map_ptr = mxGetPr(prhs[0]);
	
    int start = (start_p[0]-1)*m + (start_p[1]-1);
    int goal = (goal_p[0]-1)*m + (goal_p[1]-1);
    
    if( goal >= m*n || start >= m*n || goal < 0 || start < 0) mexErrMsgTxt("Illegal start point or destination!");
    //maze solve
    
    vector<point> run(m*n);
	vector<bool> inqueue( m*n, false );
	
	for( int i = 0; i < m*n ; i++ ) run[i].dist = -1;
	
	run[ start ].dist = 0;
	run[ start ].parent = start;
	
	queue<int> Q;
	Q.push( start );
	inqueue[ start ] = true;
	
	while(!Q.empty()){
		
		int a = Q.front(); Q.pop();
        inqueue[ a ] = false;
		//if( inqueue[ run[ a ].parent ] ) continue;
		//mexPrintf("Current: %d \n",a);
		
		if( (a>=m) && map_ptr[a-m]==1 && ( ( run[a-m].dist > (run[a].dist + 1) ) || (run[a-m].dist == -1) ) ) {			//左 邊界 可不可以走 距離較短 
			
			run[a-m].dist = run[a].dist + 1;
			run[a-m].parent = a;
			//mexPrintf("1: %d \n",a-m);
			if (!inqueue[a-m]){
				Q.push(a-m);
				inqueue[a-m] = true;
			}
		
		}
		if( ((a%m) != 0) && map_ptr[a-1]==1 && ( ( run[a-1].dist > (run[a].dist + 1) ) || (run[a-1].dist == -1) ) ) {		//上
			run[a-1].dist = run[a].dist + 1;
			run[a-1].parent = a;
			//mexPrintf("2: %d \n",a-1);
			if (!inqueue[a-1]){
				Q.push(a-1);
				inqueue[a-1] = true;
			}
		}
		if( ((a+m) < (m*n)) && map_ptr[a+m]==1 && ( ( run[a+m].dist > (run[a].dist + 1) ) || (run[a+m].dist == -1) ) ) {		//右
		
			run[a+m].dist = run[a].dist + 1;
			run[a+m].parent = a;
			//mexPrintf("3: %d \n",a+m);
			if (!inqueue[a+m]){
				Q.push(a+m);
				inqueue[a+m] = true;
			}
		
		}
		if( ((a%m) != (m-1)) && map_ptr[a+1]==1 && ( ( run[a+1].dist > (run[a].dist + 1) ) || (run[a+1].dist == -1) ) ) {		//down
			run[a+1].dist = run[a].dist + 1;
			run[a+1].parent = a;
			//mexPrintf("4: %d \n",a+1);
			if (!inqueue[a+1]){
				Q.push(a+1);
				inqueue[a+1] = true;
			}
		}
		//註解 
		
	}
	
	int trace = goal;
	vector<int> path;
	/*for(int i=0;i<m*n;i++){
        mexPrintf("Distant: %d  ", run[i].dist);
        if((i+1)%10==0) mexPrintf("\n");
    }*/
	while( run[trace].dist != 0 && run[trace].dist != -1 ){
		path.push_back(trace);
		trace=run[trace].parent;
	}
	
	if(path.empty()){ mexErrMsgTxt("Path does not exist!!"); }
	else{
		
		path.push_back(trace);
		
		int len = path.size();
    
    	plhs[0]=mxCreateDoubleMatrix( len , 2, mxREAL);
    	double* ans = mxGetPr(plhs[0]);
    	
		for(int i=0;i<len;i++) {
			ans[i] = (path[len-i-1]-(path[len-i-1]%m))/m+1;
			ans[i+len]= (path[len-i-1]%m)+1;
		}
		
    }
    //return 0;

}
