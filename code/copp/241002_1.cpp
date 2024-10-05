#include <bits/stdc++.h>
using namespace std;
vector<vector<int>> g;
int dfs(int v) {
    int m = 0;
    for(int u : g[v]) {
        if(u == v)
            continue;
        m = max(m, dfs(u));
    }
    return m + 1;
}
int main() {
    int n, m;
    cin >> n >> m;
    g.resize(m);
    // примечание: на входе данные в 1-индексации, а мы будем работать в 0-инд.
    for(int i= 0; i < n; ++i) {
        int v, u;
        cin >> v >> u;
        --v; --u; // переходим в 0-индексацию
        g[v].push_back(u);
        g[u].push_back(v);
    }

}



